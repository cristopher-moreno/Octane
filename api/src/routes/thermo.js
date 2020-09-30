const express = require('express')
const thermo = require('../controllers/thermo')

const router = express.Router();

router.route('/')
    .get(thermo.getLinearInterpolation)

module.exports = router;