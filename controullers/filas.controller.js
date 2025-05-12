const mysql = require("../mysql").pool;


exports.entrarfila = async (req, res, next) => {
    try {
        const resultados = await mysql.execute(
            `INSERT INTO line (
                users_id,
                atracoes_id
            )
            VALUES (?,?)`,
            [ res.locals.idUsuario,
              req.params.idRide
            ]);
            return res.status(201).send({
                "Mensagens": resultados
            });
    } catch (error) {
        return res.status(500).send(error)
    }   }