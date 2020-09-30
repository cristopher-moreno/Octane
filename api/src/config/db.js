const { Pool, Client } = require('pg')
// pools will use environment variables
// for connection information
// https://node-postgres.com/features/connecting 
const db = new Pool()

module.exports = db;