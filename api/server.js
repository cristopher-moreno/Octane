
const express = require('express')
const bodyParser = require('body-parser')
require('dotenv').config({ path: '.env' })

const app = express()
const port = process.env.EXPRESS_PORT

const defaultRoute = '/api/v1/';
//const thermo = require('./src/routes/thermo');
const octane = require('./src/routes/octane');

//ROUTES
//app.use(defaultRoute + 'thermo', thermo);
app.use(defaultRoute + 'octane', octane);


app.listen(port, () => {

    console.log(`App listening @ http://localhost:${port}`)
})