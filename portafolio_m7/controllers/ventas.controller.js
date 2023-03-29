const { Producto } = require('../models/')
const { Venta } = require('../models/')
const { Usuario } = require('../models/')
const { detalleVenta} = require('../models/') 
const { DetalleCarro} = require('../models/')
const { Carro } = require('../models/')
const { sequelize } = require('../models/')



//gets
module.exports.generarVenta = async (req, res) => {
    let idCarroReq = req.body.id;
    let totalCompra = req.body.precioTotalCompra;
    let idCliente = 2;
    const t = await sequelize.transaction();

    try {
        // paso 1: encontrar carro del cliente
            let carro = await Carro.findOne({
                raw:true,
                where:{
                    id: idCarroReq
                }
            })

            if(carro == null) throw new Error("No existe carrito asociado.")

        //paso 2: encontrar detalle de productos en carro cliente

        let detalleProductos = await DetalleCarro.findAll({
            raw: true,
            where: {
                idCarro: idCarroReq
            }
        })

        if(detalleProductos.length == 0) throw new Error("cliente no tiene productos en el carro.")


        //paso 3:CREAR VENTA

        let nuevaVenta = await Venta.create({
            idUsuario: idCliente,
            subtotal: totalCompra,
            descuento: 0,
            precioTotal: totalCompra 
        }, { transaction: t })

        let idVentaT = nuevaVenta.dataValues.id;
        console.log(idVentaT);



        //paso 4: DESCONTAR STOCK
        for (let index = 0; index < detalleProductos.length; index++) {
            let idP = detalleProductos[index].idProducto;
            let cantidadP = detalleProductos[index].cantidad;
            const producto= await Producto.findOne({
                where: {id: idP}
            });

            if(producto == null){
                throw new Error("un producto no existe.")
            }
            await producto.decrement({stock: cantidadP}, { transaction: t })  
            
            //paso 5: INGRESAR PRODUCTOS VENDIDOS A LA TABLA DETALLE VENTAS

            const detalleBoleta = await detalleVenta.create({
                idVenta: idVentaT,
                idProducto: idP,
                cantidad: cantidadP,
                precioUnitario: producto.dataValues.precio

            }, { transaction: t })

        }
        //pase 6: VACIAR EL CARRO.
            await DetalleCarro.destroy({
                where:{
                    idCarro: idCarroReq
                }
            },{ transaction: t })
            
            await Carro.destroy({
                where:{
                    id: idCarroReq
                }
            }, { transaction: t })

        await t.commit();
        res.status(201).json({code: 201, data:nuevaVenta})
    } catch (error) {
        await t.rollback();
        res.status(500).json({code: 500, error:"Error al generar la venta."})
    }

}


module.exports.getVentas = async (req, res) => {
    Venta.findAll().then(ventas => {
        res.json({ventas});
    }).catch(error => {
        res.json({code: 500, message:"Error al cargar los datos"});
    })
}

module.exports.getVentaById = async (req, res) => {
   try {
       let id = req.params.id;
       let venta = await Venta.findByPk(id);
       console.log(venta);
       if (venta === null) {
           res.status(400).send("No se ha encontrado la venta solicitada")
       } else {
           res.json({data: venta, message: "Dato encontrado correctamente"})
       }
   } catch (error) {
       res.status(500).send("Error al buscar los datos de la venta")
   }
}


module.exports.getDetalleVenta = async (req, res) => {
    try {
        let id = req.params.id;
        let productosVendidos= await detalleVenta.findAll({
            where: {idVenta: id}
        });

        let totalVenta = await detalleVenta.sum('precioUnitario', {
            where: {idVenta: id}
        });

        if (productosVendidos === null) {
            res.status(400).send("No se encontraron detalles de la venta")
        } else {
            res.json({productosVendidos, totalVenta})
        }

    } catch (error) {
        res.status(500).send("Error al buscar los datos del detalle la venta")
    }
 }