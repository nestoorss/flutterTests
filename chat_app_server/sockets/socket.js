const {io} = require("../index");
const {comprobarJWT} = require("../helpers/jwt");
const {usuarioConectado, usuarioDesconectado, grabarMensaje} = require('../controllers/sockets');

// Mensajes de Sockets
io.on("connection", client => {
    console.log("Cliente conectado");
    const [valido, uid] = comprobarJWT(client.handshake.headers['x-token']);

    // Verificar autenticacion
    if (!valido) {return client.disconnect(); }

    // Cliente autenticado
    console.log("Cliente autenticado");
    usuarioConectado(uid);

    // Ingresar al usuario a una sala en particular
    // sala global, client.id
    client.join(uid);

    // Escuchar del cliente el mensaje persona
    client.on('mensaje-personal', async (payload) => {
        grabarMensaje(payload);
        io.to(payload.para).emit('mensaje-personal', payload)
    });
   
    client.on("disconnect", () => {
        console.log("Cliente desconectado");
        usuarioDesconectado(uid);
    });
})