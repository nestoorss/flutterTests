const {io} = require("../index");
const {comprobarJWT} = require("../helpers/jwt");
const {usuarioConectado, usuarioDesconectado} = require('../controllers/sockets');

// Mensajes de Sockets
io.on("connection", client => {
    console.log("Cliente conectado");
    const [valido, uid] = comprobarJWT(client.handshake.headers['x-token']);

    // Verificar autenticacion
    if (!valido) {return client.disconnect(); }

    // Cliente autenticado
    console.log("Cliente autenticado");
    usuarioConectado(uid);
   
    client.on("disconnect", () => {
        console.log("Cliente desconectado");
        usuarioDesconectado(uid);
    });
})