const mongoose = require('mongoose');
module.exports = mongoose.model('UsuarioRutina', new mongoose.Schema({
  usuario_id: String,
  rutina_id: String,
  fecha_inicio: String,
  estado: String,
  progreso: Object,
  notas_personales: String,
  modificaciones: [Object]
}));