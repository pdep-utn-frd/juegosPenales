import wollok.game.*
import personajes.*
import juego.*

object izquierda{
	
	
	
	method position() = game.at(2,4)
	method image() = "assets/arco.png"

	
	
	method colision(){
		gol.convertir()
	}
}

object medio{
	method position() = game.at(3,4)
	method image() = "assets/arco.png"
	
	method colision(){
		gol.convertir()
	}
}

object derecha{
	method position() = game.at(4,4)
	method image() = "assets/arco.png"
	
	method colision(){
		gol.convertir()
	}
}

object gol{
	method position() = game.at(1,4)
	method image() = "assets/gol.png"
	
	method convertir(){
		contadorDeGoles.sumarGol()
		game.addVisual(self)
		game.schedule(250,{juego.regresar()})
	}
}

object contadorDeGoles{
	var cantidad = 0
	
	method position() = game.at(3,6)
	 
	method text() = "GOLES: " + cantidad.toString()
		
	method sumarGol(){
		cantidad += 1
	}
	
	method reiniciar(){
		cantidad = 0
	}
}

object finDeJuego{
 	method position() = game.at(1,4)
 	method image() = "assets/gameOver.png"
}
