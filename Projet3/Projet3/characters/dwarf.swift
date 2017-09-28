import Foundation

// This class will allow to set the property of the dwarf type character
class Dwarf : Character {
    
    init(){
        super.init(health: 30, attack: 5, magic: 0, magicMax : 0, type : "nain", healthMax: 30)
        
        objects = ["arme" : AttackObject(name: "hache", attackDamage: 50, type : "arme")]
        
        self.attack = attack
        
    }
}
