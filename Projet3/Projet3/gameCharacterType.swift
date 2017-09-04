class Warrior : Character {
    // création du personnage de type guerrier.
    var epee = 10
    init() {
        super.init(health: 100, attack: 10, magic: 0)
        self.attack = attack
        if objects.count == 1 {
            attack = attack + objects[0].objectProfit
        } else {
            attack = attack + epee
        }
    }
}
class Wizard : Character {
    // création du personnage de type Mage.
    
    init(){
        super.init(health: 60, attack: 2, magic: 100)
        self.magic = magic
        if objects.count == 1 {
            magic = magic + objects[0].objectProfit
        } else {
            magic = magic
        }
    }
}
class Colossus : Character {
    // création du personnage de type Colosse.
    init(){
        super.init(health: 500, attack: 3, magic: 0)
        self.attack = attack
        if objects.count == 1 {
            attack = attack + objects[0].objectProfit
        } else {
            attack = attack
        }
    }
}
class Dwarf : Character {
    // création du personnage de type Nain.
    var hache = 50
    init(){
        super.init(health: 30, attack: 5, magic: 0)
        self.attack = attack
        if objects.count == 1 {
            attack = attack + objects[0].objectProfit
        } else {
            attack = attack + hache
        }
    }
}
