import mensajerosYPaquetes.*
//Empresa
object empresa {
  const mensajeros = [chuck , neo , roberto]
  const paquetesPendientes = []
  const paquetesEnviados = []

//Paquetes Enviados
  method enviado(paquete){
    paquetesPendientes.remove(paquete)
    paquetesEnviados.add(paquete)
  }

 //Paquetes por enviar
  method porEnviar(paquete , condicion , destino){
    paquete.estaPago(condicion)
    paquete.destino(destino)
    paquetesPendientes.add(paquete)
  }

//1. Contratar a un mensajero
  method contratar(mensajero){
    mensajeros.add(mensajero)
  }

//2. Despedir a un mensajero
  method despedir(mensajero){
    mensajeros.remove(mensajero)
  }

//3. Despedir a todos los mensajeros
  method despedirATodos(){
    mensajeros.removeAll()
  }

//4. Analizar si la mensajeria es grande (si tiene mas de dos mensajeros)
  method esGrande() = mensajeros.size() > 2

//5. Consultar si el paquete puede ser entregado por el primer empleado de la la empresa de mensajería. 
  method puedeEntregarPrimero(unPaquete){
    return unPaquete.puedeEntregarse(self.primerMensajero())
  }

  method primerMensajero() = mensajeros.first()

//6. Saber el peso del último mensajero de la empresa.
  method pesoUltimoMensajero(){
    mensajeros.last().peso()
  }

//Tercera Parte

//1. Averiguar si un paquete puede ser entregado por la empresa de mensajería, es decir, si al menos uno de sus mensajeros puede entregar el paquete.
  method paquetePuedeEntregarse(unPaquete){
    return mensajeros.any({mens => unPaquete.puedeEntregarse(mens)})}

//2. Obtener todos los mensajeros que pueden llevar un paquete dado.
  method paquetePuedeEntregarsePor(unPaquete) {
    return mensajeros.filter({mens => unPaquete.puedeEntregarse(mens)}) 
  }

//3. Saber si una mensajería tiene sobrepeso. Esto sucede si el promedio del peso de los mensajeros es superior a 500 Kg.
  method mensajerosConSobrepeso(){
    return mensajeros.any({mens => mens.peso() > 500})
  }
}