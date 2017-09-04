class Warrior : Character {
    // création du personnage de type guerrier.
    
    init() {
        super.init(health: 100, attack: 10, magic: 0)
        objects = [Epee()]
        self.attack = attack
    }
}
class Wizard : Character {
    // création du personnage de type Mage.
    
    init(){
        super.init(health: 60, attack: 2, magic: 100)
        
        self.magic = magic
        
    }
}
class Colossus : Character {
    // création du personnage de type Colosse.
    init(){
        super.init(health: 500, attack: 3, magic: 0)
        
        self.attack = attack
        
    }
}
class Dwarf : Character {
    // création du personnage de type Nain.
    
    init(){
        super.init(health: 30, attack: 5, magic: 0)
        objects = [Hache()]
        self.attack = attack
        
    }
}
