const {Producto} = require('../models/'); 
const { Carro } = require('../models/'); 
const { DetalleCarro } = require('../models/'); 
const { Usuario } = require('../models/');
const { sequelize, Sequelize } = require('../models/'); 
const { Op } = require("sequelize");
const { raw } = require('express');

//console.log(Producto)
module.exports.controllerHome= async (req, res) => {
    try {
        let productos = await  Producto.findAll({
            raw:true,
            where: {
                stock: {
                    [Op.gt]: 0
                }      
            }
        });

        let indicadorCarro = await DetalleCarro.sum('cantidad')

        res.render("home", {
            productos,
            numProduct : [{"numCarro": indicadorCarro}]
        });
    } catch (error) {
        res.status(500).render("Error al desplegar página")
    }
};

module.exports.controllerProductos = async (req, res) => {
    try {
        let id = req.params.id;
        let producto = await  Producto.findByPk(id, {
            raw:true
        });
        let arrayProducto = [] 
        arrayProducto.push(producto)
        let indicadorCarro = await DetalleCarro.sum('cantidad')
        res.render("detalleProducto", {
            arrayProducto,
            numProduct : [{"numCarro": indicadorCarro}]
        });
    } catch (error) {
        res.status(500).render("Error al desplegar página")
    }

}


module.exports.controllerCarrito = async (req, res) => {
    try {
        let carrito = await sequelize.query(`
                select pd.id, pd.nombre, pd.marca, pd. descripcion, pd.precio, pd.stock, pd.imagen1, cp.cantidad, (pd.precio * cp.cantidad) total from "Carros" ca
                join "DetalleCarros" cp on ca.id = cp."idCarro"
                join "Productos" pd on pd.id = cp."idProducto"
                order by pd.id
        `)

        let productos = carrito[0];

        let calculadora = await sequelize.query(`    
            select ca.id, sum(pd.precio * cp.cantidad) total from "Carros" ca
            join "DetalleCarros" cp on ca.id = cp."idCarro"
            join "Productos" pd on pd.id = cp."idProducto"
            group by ca.id`
        )

        let indicadorCarro = await DetalleCarro.sum('cantidad')

        let subtotal = calculadora[0]

        res.render("cart", {
            carrito: productos,
            subt: subtotal,
            numProduct : [{"numCarro": indicadorCarro}]
        });
    } catch (error) {
        res.status(500).render("Error al desplegar página")
    }


}

module.exports.controllerInventario = async (req, res) => {
    try {
        let productos = await  Producto.findAll({
            raw:true,
            order: [
                ['id', 'ASC']
            ]
        });
        res.render("inventory", {
            productos
        });      
    } catch (error) {
        res.status(500).render("Error al desplegar página")
    }
}

module.exports.getUserByName = async (req, res) => {
    try {
        let {nombre} = req.query;

        console.log(nombre);

        let userSearch= await Usuario.findOne({
            where: {
                alias:nombre
              },
            raw:true
        });
        let arrayUser=[userSearch]
        if (userSearch === null) {
            res.status(400).send("Usuario no encontrado")
        } else {res.render("usuario", {
            arrayUser
            });
        }
    } catch (error) {
        res.status(500).send("Error al autenticar usuario")
    }
}

module.exports.controllerNotFound = async (req, res) => {
    try {
        res.render("default");
        
    } catch (error) {
        res.status(500).render("Error al desplegar página")
    }
}

module.exports.controllerBuscador = async (req, res) => {
    try {
        res.render("buscador");
        
    } catch (error) {
        res.status(500).render("Error al desplegar página")
    }
}
