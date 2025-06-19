const mongoose = require('mongoose');

const RutinaIdSchema = new mongoose.Schema({
  rutina: { type: String, required: true },
  estado: { type: String, required: true },
  fecha_inicio: { type: String, required: true }
}, { _id: false });

const ProgresoSchema = new mongoose.Schema({
  dias_completados: Number,
  ultimo_dia_completado: String
}, { _id: false });

const ModificacionSchema = new mongoose.Schema({
  dia: String,
  ejercicios_extra: [String]
}, { _id: false });

const UsuarioRutinaSchema = new mongoose.Schema({
  usuario_id: { type: String, required: true },
  rutinas_ids: [RutinaIdSchema], // CAMBIADO: ahora es arreglo de objetos
  fecha_inicio: String,
  progreso: ProgresoSchema,
  notas_personales: [String],    // CAMBIADO: ahora es arreglo de strings
  modificaciones: [ModificacionSchema],
  dia1: String
}, { collection: 'usuario_rutinas' });

module.exports = mongoose.model('UsuarioRutina', UsuarioRutinaSchema);
