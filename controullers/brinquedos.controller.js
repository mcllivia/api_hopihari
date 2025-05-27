const mysql = require('../mysql');
exports.cadastrarBrinquedo = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(
            `INSERT INTO rides (name, waiting_time, status, areas)
             VALUES (?, ?, ?, ?);`,
            [req.body.name,
            req.body.description, 
            req.body.duration, 
            req.body.height_limit, 
            req.body.id_areas]
        );
        return res.status(201).send({ "Mensagem": "Brinquedo cadastrado com sucesso!", "Resultado": resultado });
    } catch (error) {
        return res.status(500).send({ 'error': error });
    }
}

exports.cadastrarBrinquedosByAreaName = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(
            `SELECT* FROM rides WHERE  id_areas = (
            SELECT id  FROM areas WHERE name = ?);
            `, [req.params.AreaName] );
        if (resultado.length == 0) {
            return res.status(404).send({ "Mensagem": "Área do parque não encontrada" });
        }
        
        return res.status(200).send({ "Mensagem": "Brinquedos encontrados com sucesso!", "Resultados": resultados });
   } catch (error) {
        return res.status(500).send({ 'error': error });
    }
}