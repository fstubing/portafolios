'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Usuarios', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      alias: {
        type: Sequelize.STRING,
        allowNull:false,
        validate: {
            notEmpty: true
        }
      },
      nombre: {
        type: Sequelize.STRING,
        allowNull:false,
        validate: {
            notEmpty: true
        }
      },
      apellido: {
        type: Sequelize.STRING,
        allowNull:false,
        validate: {
            notEmpty: true
        }
      },
      email: {
        type: Sequelize.STRING,
        allowNull:false,
        validate: {
            notEmpty: true,
            isEmail:true
        }
      },
      password: {
        type: Sequelize.STRING,
        allowNull:false,
        validate: {
            notEmpty: true
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Usuarios');
  }
};