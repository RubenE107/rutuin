const express = require('express');
const router = express.Router();
const Reto = require('../models/Reto');

router.get('/', async (req, res) => {
  res.json(await Reto.find());
});

module.exports = router;