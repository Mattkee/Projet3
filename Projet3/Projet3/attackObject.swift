import Foundation

// This class will allow to set the property to an attack object.
class AttackObject : Objects {
    //this propertie set the point of attack for object
    var attackDamage : Int

    init(name : String, attackDamage: Int, type : String) {
        
        self.attackDamage = attackDamage
        super.init(name: name, attack: attackDamage, magic: 0, defense: 0, type : type)
    }
}
