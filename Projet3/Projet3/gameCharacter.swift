class Character {
    // création des paramètres commun à tous les personnages.
    var name : String = ""
    var health : Int
    var attack : Int
    
    init(health : Int, attack : Int) {
        self.health = health
        self.attack = attack
    }
}

class Warrior : Character {
    // création du personnage de type guerrier.
    var epee = 10
    init(name : String) {
        super.init(health: 100, attack: 10)
        self.attack = attack
        attack = attack + epee
    }
}
class Wizard : Character {
    // création du personnage de type Mage.
    func soign () {
        
    }
    var magie = 100
    init(name : String){
        super.init(health: 60, attack: 2)
    }
}
class Colossus : Character {
    // création du personnage de type Colosse.
    init(name : String){
        super.init(health: 500, attack: 3)
    }
}
class Dwarf : Character {
    // création du personnage de type Nain.
    var hache = 50
    init(name : String){
        super.init(health: 30, attack: 5)
        self.attack = attack
        attack = attack + hache
    }
}
