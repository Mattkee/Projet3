import Foundation

class AttackSpell : Spell {
    
    var attackSpellDamage : Int
    
    init(name : String, magicPointCost : Int, attackSpellDamage : Int) {
        
        self.attackSpellDamage = attackSpellDamage
        super.init(name: name, magicPointCost: magicPointCost)
    }
    
}
