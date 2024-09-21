object neo {
    var energia = 100
    //var vitalidad = energia / 10
    //puede ser const esElElegido
    method esElElegido() = true

    method saltar() {energia = energia * 0.5} //o sobre 2

    method vitalidad() = energia / 10 //o energia * 0.5
      

}

object morfeo {
    var vitalidad = 8
    var estaCansado = false
    
    method vitalidad() = vitalidad

    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado // o not estaCansado
    }

    method estaCansado() = estaCansado

    method esElElegido() = false
}

object trinity {
    method vitalidad() = 0

    method esElElegido() = false

    method saltar() {}
}

object nave {
    const property pasajeros = [neo, morfeo, trinity] //va el property por los test y hace que no varien los objetos de la lista, porque te crea el metodo pasajeros() = pasajeros
    
    method subirA(unPasajero) {
        pasajeros.add(unPasajero)
    }

    method bajarA(unPasajero) {
        pasajeros.remove(unPasajero)
    }

    method cuantosPasajerosHay() = pasajeros.size()

    method pasajeroMasVital() = pasajeros.max({p => p.vitalidad()})

    method estaElElegido() = pasajeros.any({p => p.esElElegido()})

    method estaEquilibrada(){
        return
        self.pasajeroMasVital().vitalidad() <= 
        self.pasajeroMenosVital().vitalidad() * 2
    }

    method pasajeroMenosVital() = pasajeros.min({p => p.vitalidad()})

    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear() //con un removeAll(self.pasajeros) y con un forEach({p => pasajeros.bajarA(p)})
    }

    method acelerar() {
        self.pasajerosSinElElegido().forEach({p => p.saltar()})        
    }

    method pasajerosSinElElegido() = pasajeros.filter({p => !p.esElElegido()})
}