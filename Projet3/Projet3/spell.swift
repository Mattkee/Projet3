import Foundation

// This class to set the properties and methods of the spells of the game.
class Spell {
    
    var name : String
    var magicPointCost : Int
    var attack : Int
    var spellNumber : Int = 0
    
    // this array contain the list of different Attack spells.
    static var listAttackSpell = [
        AttackSpell(name: "boule de feu", magicPointCost: 20, attackSpellDamage: 25),
        AttackSpell(name: "éclair de glace", magicPointCost: 25, attackSpellDamage: 30)
    ]

    init(name: String , magicPointCost : Int, attack : Int) {
        self.name = name
        self.magicPointCost = magicPointCost
        self.attack = attack
        
    }

    
    // this method return the type of selected spell.
    static func checkSpellType (characterSelected : Character, newSpell : Spell) {
        
        for spell in characterSelected.spell {
            
            if let attackSpell = spell as? AttackSpell {
                
                print("\(characterSelected.name) reçoit le sort de combat \(newSpell.name) qui lui donne \(attackSpell.attackSpellDamage)")
                print("")
                
            }
        }
    }
}
