import Foundation

// This class will allow to set the property of the dwarf type character
class Dwarf : Character {
    
    init(){
        super.init(health: 30, attack: 5, magic: 0)
        
        objects = [AttackObject(name: "hache", attackDamage: 50)]
        
        self.attack = attack
        
    }
}
