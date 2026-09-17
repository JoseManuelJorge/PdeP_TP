object casa{
  var suciedad = 0
  var cuidador = tom
  var quilombero = null

  method cuidador(){
    return cuidador
  }

  method ensuciar(cantidad){
    suciedad = suciedad + cantidad
  }

  method limpiar(cantidad){
    suciedad = 0.max(suciedad - cantidad)
  }

  method limpiarTodo(){
    suciedad = 0
  }

  method pasarDia() {
    cuidador.limpiarCasa()
    if(quilombero != null and cuidador.atrapar(quilombero))
    {
      quilombero = null
    }
  }

  method pasarNoche() {
    cuidador.dormir()
    if(quilombero != null)
    {
      quilombero.quilombo()
    }
  }
}


object tom
{
  var energia = 100

  method limpiarCasa(){
    casa.limpiar(100)
    energia = energia - 40
  }

  method velocidad(){
    return 5 + (energia / 10)
  } 

  method interrumpirSuenio() {
    energia -= 20
  }

  method dormir(){
    energia += 50
  }

  method atrapar(quilombero){
    return self.velocidad() > quilombero.velocidad()
  }
  
}

object jerry{
  var peso = 100

  method velocidad(){
    return 10 - peso 
  }

  method peso() = peso

  method quilombo()
  {
    casa.ensuciar(110)
    peso += 1
  }
}

object tuffy{
  var peso = 5 // implementado por el cuidador nuevo

  method peso() = peso

  method velocidad() {
    return 10
  }

  method quilombo(){
    casa.cuidador().interrumpirSuenio()
  }

}

object robocat
{
  method limpiarCasa()
  
  {
    casa.limpiarTodo()
  }
  method dormir() {
    //vacio, se apaga solamente
  }
  method interrumpirSuenio() {
    //vacio, para que lo tome, pero no puede ser interrumpido
  }
  method atrapar(quilombero){
    return true
  }
}

object pandilla {
  const miembros = [jerry, tuffy]

  method agregarMiembro(nuevo){
    miembros.add(nuevo)
  }

  method velocidad() {
    return (miembros.min({m => m.velocidad()}).velocidad() / 2)
    
  }
  
  method quilombo() {
    // 1. Todos los miembros hacen su quilombo
    miembros.forEach({ m => m.quilombo() })
    
    // 2. Si son más de 3, interrumpen el sueño
    if (miembros.size() > 3) {
      casa.cuidador().interrumpirSuenio()
    }
  }
} 

object spike
{
  var peso = 80
  
  var energia = 100

  method limpiarCasa(){
    casa.limpiar(50)
    energia = energia - 10
  }

  method velocidad(){
    return 200
  } 

  method interrumpirSuenio() {
    energia -= 40
  }

  method dormir(){
    energia += 25
  }

  method atrapar(quilombero){
    return peso > quilombero.peso()
  }
}

object pato{
  var peso = 20 

  method peso() = peso

  method velocidad() {
    return 99
  }

  method quilombo(){
    casa.ensuciar(200)
    casa.cuidador().interrumpirSuenio()
  }

}