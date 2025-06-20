const mongoose = require('mongoose');
module.exports = mongoose.model('UsuarioReto', new mongoose.Schema({
  usuario_id: String,
  reto_id: String,
  estado: String,
  progreso: Number,
  fecha_inicio: String
}));