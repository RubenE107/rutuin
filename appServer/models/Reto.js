const mongoose = require('mongoose');
module.exports = mongoose.model('Reto', new mongoose.Schema({
  _id: String,
  titulo: String,
  descripcion: String,
  dificultad: String,
  recompensa: Number
}));