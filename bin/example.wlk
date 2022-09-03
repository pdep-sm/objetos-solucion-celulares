/**
Ejercicio 4 - Celulares

A) Se pide representar con objetos a personas que hablan entre sí 
por celulares.
Juliana tiene un Samsung S21, y Catalina tiene un iPhone.
El Samsung S21 pierde 0,25 "puntos" de batería por cada llamada, 
y el iPhone pierde 1% de la duración de cada llamada en batería. 
Ambos celulares tienen 5 "puntos" de batería como máximo.
Implementar a Juliana, Catalina, el Samsung S21 de Juliana y el 
iPhone de Catalina en Wollok y hacer pruebas en donde Juliana y 
Catalina se hagan llamadas telefónicas de distintas duraciones.
 - Conocer la cantidad de batería de cada celular.
 - Saber si un celular está apagado (si está sin batería).
 - Recargar un celular (que vuelva a tener su batería completa).
 - Saber si Juliana tiene el celular apagado; saber si Catalina tiene 
el celular apagado.
 */
 
/**
 * B) Ahora podemos, también, tener en cuenta el costo 
 * de las llamadas que se hacen entre Catalina y 
 * Juliana. Catalina tiene contratado como servicio 
 * de telefonía celular a Movistar, Juliana a Personal. 
 * Movistar cobra fijo $60 final el minuto, Claro cobra
 *  $50 el minuto + 21% de IVA y Personal $70 final 
 * los primeros 10 minutos que usaste el celu, y $40 
 * el minuto el resto. 
 */
 
object juliana {
	
	var telefono = s21
	var compania = personal
	var saldoAdeudado = 0
	
	method tieneTelefonoApagado() = telefono.estaApagado()
	
	method llamarA(persona, duracion) {
		saldoAdeudado += compania.calcularCosto(duracion)
		telefono.restarBateria(duracion)
		persona.atenderLlamada(duracion)
	}
	
	method atenderLlamada(duracion) {
		telefono.restarBateria(duracion)
	}
	
	method telefono() = telefono
}


object catalina {
	
	var telefono = iPhone
	var compania = movistar
	var saldoAdeudado = 0
	
	method tieneTelefonoApagado() = telefono.estaApagado()
		
	method llamarA(persona, duracion) {
		saldoAdeudado += compania.calcularCosto(duracion)
		telefono.restarBateria(duracion)
		persona.atenderLlamada(duracion)
	}
	
	method atenderLlamada(duracion) {
		telefono.restarBateria(duracion)
	}
	
	method telefono() = telefono
}


object s21 {
	
	var bateria = 5
	
	method bateria() = bateria
	
	method estaApagado() = bateria <= 0
	
	method recargar() {
		bateria = 5
	}
	
	method restarBateria(duracionLlamada) {
		bateria -= 0.25
	}
}


object iPhone {
	
	var bateria = 5
	
	method bateria() {
		return bateria
	}
	
	method estaApagado() = bateria == 0
	
	method recargar() {
		bateria = 5
	}
	
	method restarBateria(duracionLlamada) {
		bateria = 0.max(bateria - 0.01 * duracionLlamada)
	}
}

object movistar {
	
	method calcularCosto(duracionLlamada) = 
		duracionLlamada * 60
	
}

object claro {
	
	method calcularCosto(duracionLlamada) = 
		duracionLlamada * 50 * 1.21
}

/**Personal cobra $70 final 
 * los primeros 10 minutos que usaste el celu, y $40 
 * el minuto el resto. 
 */
object personal {
	
	method calcularCosto(duracionLlamada) =
		70 + 0.max(duracionLlamada - 10) * 40
	
}






