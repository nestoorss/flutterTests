const {io} = require("../index");
const Band = require("../models/band");
const Bands = require("../models/bands");

const bands = new Bands();

bands.addBand(new Band("Goty"));
bands.addBand(new Band("Fary"));
bands.addBand(new Band("Puso"));
bands.addBand(new Band("Amir"));

// Mensajes de Sockets
io.on("connection", client => {
    console.log("Cliente conectado");

    client.emit("active-bands", bands.getBands())
    
    client.on("disconnect", () => {
        console.log("Cliente desconectado");
    });

    client.on('vote-band', ( payload ) => {
        bands.voteBand(payload.id);
        io.emit("active-bands", bands.getBands())
    });

    client.on('add-band', ( payload ) => {
        const newBand = new Band(payload.name);
        bands.addBand(newBand);
        io.emit("active-bands", bands.getBands())
    });

    client.on('delete-band', ( payload ) => {
        bands.deleteBand(payload.id);
        io.emit("active-bands", bands.getBands())
    });
})