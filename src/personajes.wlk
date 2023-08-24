
import wollok.game.*
import juego.*
import arco.*

object pelota{
	const puntoPenal = game.at(3,1)
	var puedePatear = true
	var property position = puntoPenal
	
	method image() = "assets/pelota.png"
	
	method control(){	
		keyboard.num(1).onPressDo{self.patear(2)}
		keyboard.num(2).onPressDo{self.patear(3)}
		keyboard.num(3).onPressDo{self.patear(4)}
	}
	
	method colisionaCon(otroElemento){
		game.removeTickEvent("mover")
		otroElemento.colision()
	}
	
	method patear(posicion){
		if (puedePatear){
		puedePatear = false
		arquero.mover()
		position = game.at(posicion,2)
		game.schedule(50,{self.mover()})
		}
	}
	

method mover(){
		game.onTick(50,"mover",{position = position.up(1)})
	}
		
	method regresar(){
		position = puntoPenal
		puedePatear = true
	}
	
}

object arquero{
	const centroDelArco = game.at(3,3)
	var property position = centroDelArco
	
	method image() = "assets/arquero.png"
	
	method colision(){
		keyboard.space().onPressDo{juego.resetear()}
		game.addVisual(finDeJuego)
	}
	
	method mover(){
		position = position.right((-1).randomUpTo(2))
	}
	
	method regresar(){
		position = centroDelArco
	}

}




