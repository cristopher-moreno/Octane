const db = require('../config/db')

exports.getAllRecords = (req, res) => {

    const query = `
    select
        id_trip ,
        punto_inicio ,
        punto_fin ,
        fecha_inicio ,
        fecha_fin ,
        costo ,
        volumen ,
        distancia ,
        duracion ,
        economia_combustible ,
        costo_trip
    from
        trip
    order by
        id_trip
    `
    db.query(query, (error, results) => {
        if (error) { res.status(500).json('bad query') }

        //console.log(results.rows)
        res.status(200).json(results.rows)
    })
}


exports.getAllFuelEconomy = (req, res) => {

    const query = `
    select
        id_trip ,        
        economia_combustible 
    from
        trip
    order by
        id_trip
    `
    db.query(query, (error, results) => {
        if (error) { res.status(500).json('bad query') }

        res.status(200).json(results.rows)
    })
}


exports.getAllCostTrip = (req, res) => {

    const query = `
    select
        id_trip ,
        costo_trip
    from
        trip
    order by
        id_trip
    `
    db.query(query, (error, results) => {
        if (error) { res.status(500).json('bad query') }

        res.status(200).json(results.rows)
    })

}



