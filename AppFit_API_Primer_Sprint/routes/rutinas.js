const express = require('express');
const router = express.Router();
const Rutina = require('../models/Rutina');

router.get('/', async (req, res) => {
  res.json(await Rutina.find());
});

module.exports = router;