const mongoose = require('mongoose');
module.exports = mongoose.model('Mascota', new mongoose.Schema({
  nombre: String,
  continente: String,
  descripcion: String,
  evoluciones: [Object]
}));