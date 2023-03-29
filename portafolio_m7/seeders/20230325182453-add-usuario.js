'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  up: (queryInterface, Sequelize) => {

    let usuarios = [
      {
        alias: "pedro59",
        nombre: "Pedro",
        apellido: "Soto",
        email: "psoto@mail.cl",
        password: "1234",
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        alias: "juanito23",
        nombre: "Juan",
        apellido: "Diaz",
        email: "jdiaz@mail.cl",
        password: "12345",
        createdAt: new Date(),
        updatedAt: new Date()      },
      {
        alias: "Sivia101",
        nombre: "Silvia",
        apellido: "Lara",
        email: "slara@mail.cl",
        password: "123456",
        createdAt: new Date(),
        updatedAt: new Date() 
      },


    ]

    return queryInterface.bulkInsert('Usuarios', usuarios);
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Usuarios', null, {});
  }
};