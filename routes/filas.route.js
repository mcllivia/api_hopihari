const express = require("express");
const router = express.Router();
const login = require("../middleware/usuarios.middleware");
const filasController = require("../controullers/filas.controller");

router.post("/:idRide", login.required, filasController.verificarBrinquedo, filasController.entrarFila);

module.exports = router; 