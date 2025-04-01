const express = require('express');
const path = require('path');
require('dotenv').config();

// DB Config
const { dbConnection } = require('./database/config');
dbConnection();

// App de Express
const app = express();

// Lectura y parseo del Body
app.use(express.json());

// Node server
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);
require('./sockets/socket');

// Path publico
const publicPath = path.resolve(__dirname, "public");

// Mis rutas
app.use('/api/login', require('./routes/auth'));

app.use(express.static(publicPath));

const PORT = process.env.PORT || 3000;
server.listen(process.env.PORT, (err) => {
    if (err) throw new Error(err);
    console.log(`Servidor corriendo en puerto:${PORT}`);
});