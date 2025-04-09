const { response } = require('express');
const { validarGoogleIdToken } = require('../helpers/google-verify-token');

const googleAuth = async (req, res = response) => {

    const token = req.body.token;

    if (!token) {
        return res.json({
            ok: false,
            msg: 'No hay token en la peticion'
        });
    }

    const googleUser = await validarGoogleIdToken(token);

    if (!googleUser) {
        return res.status(400).json({
            ok: false,
            msg: 'Token no válido'
        });
    }

    // TODO: Guardar en su base de datos

    res.json({
        ok: true,
        googleUser
    });
}

module.exports = {
    googleAuth
}