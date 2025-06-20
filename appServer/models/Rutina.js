const mongoose = require('mongoose');
module.exports = mongoose.model('Rutina', new mongoose.Schema({
  nombre: String,
  descripcion: String,
  recomendado: String,
  no_recomendado: String,
  dias: [Object],
  origen: String
}));