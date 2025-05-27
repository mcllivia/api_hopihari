const express = require('express');
const router = express.Router();
const login = require('../middleware/usuarios.middleware');
const brinquedosController = require('../controullers/brinquedos.controller');

router.post('/', login.required, 
    login.userRequired,
    brinquedosController.cadastrarBrinquedo);


router.get('/area/areaname', 
    login.required,
brinquedosController.getBrinquedosByAreaName);

module.exports = router;