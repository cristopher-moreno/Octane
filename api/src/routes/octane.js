const express = require('express')
const octane = require('../controllers/octane')

const router = express.Router();

router.route('/')
    .get(octane.getAllRecords)

router.route('/fuel_economy')
    .get(octane.getAllFuelEconomy)

router.route('/cost_trip')
    .get(octane.getAllCostTrip)

module.exports = router;