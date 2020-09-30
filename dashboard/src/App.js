import React from "react";
import { useForm } from "react-hook-form"

export default function App() {

  const { register, handleSubmit } = useForm()

  const onSubmit = (data) => {
    console.log(data)
  }

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input type="email" placeholder="Email" name="email" ref={register} />
      <input type="password" placeholder="Password" name="password" ref={register} />
      <input type="submit" />
    </form>
  )
}