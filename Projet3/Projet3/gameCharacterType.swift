class Warrior : Character {
    // création du personnage de type guerrier.
    var epee = 10
    init() {
        super.init(health: 100, attack: 10, magic: 0)
        self.attack = attack
        attack = attack + epee
    }
}
class Wizard : Character {
    // création du personnage de type Mage.
    func soign () {
        
    }
    init(){
        super.init(health: 60, attack: 2, magic: 100)
    }
}
class Colossus : Character {
    // création du personnage de type Colosse.
    init(){
        super.init(health: 500, attack: 3, magic: 0)
    }
}
class Dwarf : Character {
    // création du personnage de type Nain.
    var hache = 50
    init(){
        super.init(health: 30, attack: 5, magic: 0)
        self.attack = attack
        attack = attack + hache
    }
}
