const express = require("express");
const router = express.Router();
const usuariosController = require("../controullers/usuarios.controullers");

router.post('/', usuariosController.cadastrarUsuario); 
router.post('/login', usuariosController.login);
router.put('/:id', usuariosController.atualizarUsuario);

module.exports = router;