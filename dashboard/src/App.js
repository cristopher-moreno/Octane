import React from "react";
import { useForm } from "react-hook-form"
import { Button } from 'react-bootstrap';

import 'bootstrap/dist/css/bootstrap.min.css';


export default function App() {

  const { register, handleSubmit } = useForm()

  const onSubmit = (data) => {
    console.log(data)
  }

  return (

    <form onSubmit={handleSubmit(onSubmit)}>
      <div>
        <input type="number" placeholder="id_trip" name="id_trip" ref={register} required />
        <input type="date" placeholder="fecha_inicio" name="fecha_inicio" ref={register} required />
        <input type="date" placeholder="fecha_fin" name="fecha_fin" ref={register} required />
        <input type="number" placeholder="punto_inicio" name="punto_inicio" ref={register} required />
        <input type="number" placeholder="punto_fin" name="punto_fin" ref={register} required />
        <input type="number" step="0.01" placeholder="costo" name="costo" ref={register} required />
        <input type="number" step="0.001" placeholder="volumen" name="volumen" ref={register} required />
      </div>

      <Button type="submit" variant="success">OK</Button>{' '}

    </form>




  )
}