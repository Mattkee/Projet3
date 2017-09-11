import Foundation

// This class to set the properties and methods of the spells of the game.
class Spell {
    
    var name : String
    var magicPointCost : Int
    
    init(name: String , magicPointCost : Int) {
        self.name = name
        self.magicPointCost = magicPointCost
    
    }
    
    // this array contain the list of different Attack spells.
    var listAttackSpell = [
        
        AttackSpell(name: "boule de feu", magicPointCost: 20, attackSpellDamage: 25),
        AttackSpell(name: "éclair de glace", magicPointCost: 25, attackSpellDamage: 30)
    ]
}
