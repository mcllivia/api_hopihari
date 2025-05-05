const express = require("express");
const router = express.Router();
const usuariosController = require("../controullers/usuarios.controullers");

router.post('/login', () => { console.log("Rota de Login") });
router.put('/:id', usuariosController.atualizarUsuario);
router.post('/cadastrar', usuariosController.cadastrarUsuario); 



module.exports = router;