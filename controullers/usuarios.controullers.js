const mysql = require("../mysql");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

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
        return res.status(500).send(error);

    }

}

exports.cadastrarUsuario = async (req, res,) => {
    try {
        const hash = await bcrypt.hash(req.body.password, 10);
        const resultado = await mysql.execute(`
            INSERT INTO users (
             first_name,
             last_name, 
             email,
             password, 
             birth_date,
             phone
            )
            VALUES (?,?,?,?,?,?);`, [
            req.body.first_name,
            req.body.last_name,
            req.body.email,
            hash,
            req.body.birth_date,
            req.body.phone
        ]);

        return res.status(201).send({
            "Mensagem": "Usuário cadastrado com sucesso",
            "Resultado": resultado
        });

    } catch (error) {
        return res.status(500).send(error);

    }
}
exports.login = async (req, res) => {
    try {
        const Usuario = await mysql.execute(`
            SELECT * FROM users WHERE email = ?`, [
            req.body.email

        ]);

        if (Usuario.length == 0) {
            return res.status(401).send({
                "Mensagem": "Usuário não cadastrado",
            });
        }

        const match = await bcrypt.compare(req.body.password, Usuario[0].password);

        if (!match) {
            return res.status(401).send({
                "Mensagem": "Senha incorreta",
            });
        }

        const token = jwt.sign({
            id: Usuario[0].id,
            first_name: Usuario[0].first_name,
            last_name: Usuario[0].last_name,
            email: Usuario[0].email,
            birth_date: Usuario[0].birth_date,

        }, 'senhadojwt');
        return res.status(200).send({
            "Mensagem": "Usuário autenticado com sucesso",
            "token": token
        });

    } catch (error) {
        return res.status(500).send(error);

    }
}       