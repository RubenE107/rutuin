const mongoose = require('mongoose');

const usuarioSchema = new mongoose.Schema({
  email: { type: String, required: true, unique: true },
  contraseña: { type: String, required: true },
  nombre: { type: String, required: true },
  medidas: { type: Object, default: {} },
  rol: { type: String, default: 'usuario' },
  racha_dias_entrenando: { type: Number, default: 0 },
  sexo: { type: String, default: 'no especificado' },
  edad: { type: Number, default: 0 },
  foto_perfil: { type: String, default: '' },
  peso: { type: Number, default: 0 },
  altura: { type: Number, default: 0 },
  objetivo: { type: String, default: 'no especificado' },
  nivel_actividad: { type: String, default: 'no especificado' },
  tipo_entrenamiento: { type: String, default: 'no especificado' },
  tipo_dieta: { type: String, default: 'no especificado' },
  dieta_personalizada: { type: Boolean, default: false },
  dieta: { type: Array, default: [] },
  notificaciones: { type: Object, default: {} }
});

module.exports = mongoose.model('Usuario', usuarioSchema);
