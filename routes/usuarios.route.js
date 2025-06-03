const express = require("express");
const router = express.Router();
const usuariosController = require("../controullers/usuarios.controullers");
const login = require("../middleware/usuarios.middleware");

router.post('/', usuariosController.cadastrarUsuario); 
router.post('/login', usuariosController.login);
router.put('/', login.required,usuariosController.atualizarUsuario);

module.exports = router;