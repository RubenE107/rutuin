const express = require('express');
const router = express.Router();
const Mascota = require('../models/Mascota');

router.get('/', async (req, res) => {
  res.json(await Mascota.find());
});

module.exports = router;