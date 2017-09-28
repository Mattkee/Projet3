import Foundation

// This class to set the properties and methods of the attack spells of the game
class DefenseSpell : Spell {
    
    var defenseSpellProtection : Int
    
    init(name : String, magicPointCost : Int, defenseSpellProtection : Int) {
        
        self.defenseSpellProtection = defenseSpellProtection
        super.init(name: name, magicPointCost: magicPointCost, attack : 0 , defense : defenseSpellProtection)
    }
    
}
