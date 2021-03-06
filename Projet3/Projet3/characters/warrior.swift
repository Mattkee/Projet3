import Foundation

// This class will allow to set the property of the warrior type character. 
class Warrior : Character {
    
    init() {
        super.init(health: 100, attack: 10, magic: 0, magicMax : 0, type : "combattant", healthMax: 100)
        
        objects = ["arme" : AttackObject(name: "épée", attackDamage: 10, type : "arme")]
        
        self.attack = attack
    }
}
