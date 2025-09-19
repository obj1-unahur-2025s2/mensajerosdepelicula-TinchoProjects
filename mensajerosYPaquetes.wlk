//# Primera parte: Destinos y mensajeros
/*
Desarrollar y probar un programa que me permita saber si el paquete puede ser entregado por un mensajero. Un paquete puede entregarse cuando el mensajero puede llegar al destino indicado y además el paquete está pago.
*/

//Paquetes
object paquete {
  var destino = matrix
  var property estaPago = true
  method puedeEntregarse(mensajero) = estaPago && destino.dejarEntrar(mensajero)

  method yaPagado(){
    estaPago = true
  }

  method faltaPagar(){
    estaPago = false
  }
  method cambiarDestino(nuevoDestino){
    destino = nuevoDestino
  }
}

object paquetito {
  const yaPagado = true
  method puedeEntregarse(mensajero) = true
}

object paquetonViajero {
    var destino = puenteBrooklyn
  var property estaPago = true
  method puedeEntregarse(mensajero) = estaPago && destino.dejarEntrar(mensajero)

  method yaPagado(){
    estaPago = true
  }

  method faltaPagar(){
    estaPago = false
  }
  method cambiarDestino(nuevoDestino){
    destino = nuevoDestino
  }
}

//Destinos

//- Puente de Brooklyn: deja pasar a todo lo que pese hasta una tonelada.
object puenteBrooklyn {
  method dejarEntrar(mensajero) = mensajero.peso() <= 1000
}

//- La Matrix: deja entrar a quien pueda hacer una llamada.
object matrix {
  method dejarEntrar(mensajero)  = mensajero.puedeLlamar()
}

//Mensajeros

/*
- Roberto: Roberto viaja en bicicleta o camión. Si viaja en bicicleta, el peso que cuenta es el suyo propio más 5, que es lo que pesa la bici. Si viaja en camión, el peso es el propio más el del camión, a razón de media tonelada por cada acoplado. Roberto no tiene un mango, gracias que tiene cubiertas, y no puede llamar a nadie.
*/
object roberto {
  var property vehiculo = bicicleta
  method peso() = 90 + vehiculo.pesoVehiculo()

  method puedeLlamar() = false

  method cambiarVehiculo (otroVehiculo){
    vehiculo = otroVehiculo
  }
}

/*
- Chuck Norris: Chuck Norris pesa 80 kg y puede llamar a cualquier persona del universo con sólo llevarse el pulgar al oído y el meñique a la boca.
*/
object chuck {
    method peso() = 80

  method puedeLlamar() = true

  method transporte(tipoVehiculo){

  }
}

/*
- Neo vuela, así que no pesa nada. Y anda con celular. El tema es que a veces no tiene crédito para hacer llamadas.
*/
object neo {
  var property tieneCredito = true
    method peso() = 0

  method puedeLlamar() = tieneCredito

  method gastoCredito() {
    tieneCredito = false
  }

  method cargaCredito() {
    tieneCredito = true
  }

  method transporte(tipoVehiculo){

  }
}

//Vehiculos
object camion {
  var property acoplados = 1
  method pesoVehiculo() = self.acoplados() * 500 
  method acoplados(cantidad){
    acoplados = cantidad
  }
}

object bicicleta {
  method pesoVehiculo() = 5
}