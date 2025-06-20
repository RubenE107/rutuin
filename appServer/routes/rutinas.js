const express = require('express');
const router = express.Router();
const Rutina = require('../models/Rutina');

router.get('/obtenerRutinas', async (req, res) => {
  res.status(200).json(await Rutina.find());
});
//obtener una sola ruutina por ID
router.get('/:id', async (req, res) => {
  console.log('📥 GET /rutina/:id') ;
  const { id } = req.params;
  try {
    console.log(`📥 Obteniendo rutina con ID: ${id}`) ;
    const rutina = await Rutina.findById(id);
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


module.exports = router;