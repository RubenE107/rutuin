const mongoose = require('mongoose');
module.exports = mongoose.model('UsuarioMascota', new mongoose.Schema({
  usuario_id: String,
  mascota_id: String,
  nivel: Number,
  exp: Number,
  estado: String,
  fecha_activacion: String
}));