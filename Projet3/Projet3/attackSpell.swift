import Foundation

// This class to set the properties and methods of the attack spells of the game
class AttackSpell : Spell {
    
    var attackSpellDamage : Int
    
    init(name : String, magicPointCost : Int, attackSpellDamage : Int) {
        
        self.attackSpellDamage = attackSpellDamage
        super.init(name: name, magicPointCost: magicPointCost, attack : attackSpellDamage)
    }
    
}
