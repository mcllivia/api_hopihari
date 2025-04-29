const mysql = require("../mysql");

exports.atualizarUsuario = async (req, res) => {
    try {
        const idUsuario = Number(req.params.id);

        const resultado = await mysql.execute(
            `UPDATE users
            SET name = ?,
            email = ?,
            password = ?
            WHERE id = ?;` ,
            [req.body.name,
            req.body.email,
            req.body.password,
                idUsuario]

        );

        return res.status(201).send({
            "Mensagem": "Usuário atualizado com sucesso",
            "Resultado": resultado
        });

    } catch (error) {
        return res.status(500).send({ "Mensagem": error });

    }

}