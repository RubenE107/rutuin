const express = require('express');
const router = express.Router();
const Rutina = require('../models/UsuarioRutina');
const UsuarioRutina = require('../models/UsuarioRutina');

router.get('/usuariosRutinas', async (req, res) => {
  res.status(200).json(await Rutina.find());
});
router.get('/:id', async (req, res) => {
  console.log('📥 GET /usuarioRutina/:id');
  const { id } = req.params;
  usuario_id = id;
  try {
    console.log(`📥 Obteniendo rutina con ID de usuario: ${usuario_id}`);
    const rutina = await UsuarioRutina.findOne({ usuario_id });
    console.log('📥 Rutina obtenida:', rutina);
    if (!rutina) {
      return res.status(404).json({ mensaje: 'Rutina no encontrada' });
    }
    res.status(200).json(rutina);
  } catch (error) {
    console.error('❌ Error al obtener rutina:', error);
    res.status(500).json({ mensaje: 'Error al obtener rutina' });
  }
});
//modificar la rutina de un usuario
router.put('/:id', async (req, res) => {
  console.log('📥 PUT /usuarioRutina/:id');
  const { id } = req.params;
  const { rutinas_ids } = req.body; // ahora espera rutinas_ids
  try {
    console.log(`📥 Actualizando rutinas_ids del usuario con ID: ${id}`);
    const updatedRutina = await UsuarioRutina.findOneAndUpdate(
      { usuario_id: id },
      { rutinas_ids },
      { new: true }
    );
    if (!updatedRutina) {
      return res.status(404).json({ mensaje: 'Rutina no encontrada' });
    }
    res.status(200).json(updatedRutina);
  } catch (error) {
    console.error('❌ Error al actualizar rutina:', error);
    res.status(500).json({ mensaje: 'Error al actualizar rutina' });
  }
});

//obtener un


module.exports = router;