import Foundation

// This class will allow to set the property to an attack object.
class AttackObject : Objects {
    
    var attackDamage : Int

    init(name : String, attackDamage: Int) {
        
        self.attackDamage = attackDamage
        super.init(name: name, attack: attackDamage, magic: 0, defense: 0)
    }
}
