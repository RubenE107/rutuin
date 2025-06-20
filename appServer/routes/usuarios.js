const express = require('express');
const router = express.Router();
const Usuario = require('../models/Usuario');
const bcrypt = require('bcrypt');

// GET todos los usuarios
router.get('/', async (req, res) => {
  try {
    const usuarios = await Usuario.find();
    console.log(`📥 GET /usuarios → ${usuarios.length} usuarios encontrados`);
    res.json(usuarios);
  } catch (err) {
    console.error('❌ Error al obtener usuarios:', err);
    res.status(500).json({ mensaje: 'Error al obtener usuarios' });
  }
});

// POST /usuarios/register
router.post('/register', async (req, res) => {
  try {
    const {
      email,
      contraseña,
      nombre,
      medidas,
      rol,
      racha_dias_entrenando,
      sexo,
      edad,
      foto_perfil,
      peso,
      altura,
      objetivo,
      nivel_actividad,
      tipo_entrenamiento,
      tipo_dieta,
      dieta_personalizada,
      dieta,
      notificaciones
    } = req.body;

    console.log('📥 Registro recibido:', { email, nombre });

    if (!email || !contraseña || !nombre) {
      console.log('⚠ Registro inválido: faltan campos');
      return res.status(400).json({ mensaje: 'Faltan campos requeridos' });
    }

    const existente = await Usuario.findOne({ email });
    if (existente) {
      console.log('⚠ Usuario ya existe:', email);
      return res.status(400).json({ mensaje: 'Usuario ya existe' });
    }

    const hash = await bcrypt.hash(contraseña, 10);

    const nuevo = new Usuario({
      email,
      contraseña: hash,
      nombre,
      medidas,
      rol,
      racha_dias_entrenando,
      sexo,
      edad,
      foto_perfil,
      peso,
      altura,
      objetivo,
      nivel_actividad,
      tipo_entrenamiento,
      tipo_dieta,
      dieta_personalizada,
      dieta,
      notificaciones
    });

    await nuevo.save();
    console.log('✅ Usuario registrado:', email);
    res.status(201).json({ mensaje: 'Usuario creado correctamente' });
  } catch (error) {
    console.error('❌ Error en /register:', error);
    res.status(500).json({ mensaje: 'Error en el servidor' });
  }
});

// POST /usuarios/login
router.post('/login', async (req, res) => {
  try {
    const { email, contraseña } = req.body;
    console.log('🔐 Intento de login:', email);

    const usuario = await Usuario.findOne({ email });
    if (!usuario) {
      console.log('❌ Usuario no encontrado:', email);
      return res.status(404).json({ mensaje: 'Correo no registrado' });
    }

    const coincide = await bcrypt.compare(contraseña, usuario.contraseña);
    if (!coincide) {
      console.log('❌ Contraseña incorrecta:', email);
      return res.status(401).json({ mensaje: 'Contraseña incorrecta' });
    }

    console.log('✅ Login exitoso:', email);
    res.json({
      mensaje: 'Login exitoso',
      usuario: {
        id: usuario._id,
        email: usuario.email,
        nombre: usuario.nombre
      }
    });
  } catch (error) {
    console.error('❌ Error en /login:', error);
    res.status(500).json({ mensaje: 'Error en el servidor' });
  }
});

// GET /usuarios/:id
router.get('/:id', async (req, res) => {
  try {
    const usuario = await Usuario.findById(req.params.id);
    if (!usuario) {
      console.log('❌ Usuario no encontrado con ID:', req.params.id);
      return res.status(404).json({ mensaje: 'Usuario no encontrado' });
    }
    res.json(usuario);
  } catch (error) {
    console.error('❌ Error al obtener usuario por ID:', error);
    res.status(500).json({ mensaje: 'Error en el servidor' });
  }
});

module.exports = router;
