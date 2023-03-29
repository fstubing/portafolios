const { Usuario } = require('../models/')
const { sequelize, Sequelize } = require('../models/'); 


module.exports.autenticator = async (req, res) => {
    try {
        let {nombre, clave} = req.params;
        console.log(nombre);
        let userSearch= await Usuario.findOne({
            where: {alias: nombre, password: clave}
        });

        if (userSearch === null) {
            res.status(400).send("Datos de autenticación no encontrados")
        } else {
            res.json({message: true})
        }
    } catch (error) {
        res.status(500).send("Error al autenticar usuario")
    }
}



