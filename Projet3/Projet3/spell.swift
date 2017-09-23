import Foundation

// This class to set the properties and methods of the spells of the game.
class Spell {
    
    var name : String
    var magicPointCost : Int
    var attack : Int
    var defense : Int
    
    var spellNumber : Int = 0

    init(name: String , magicPointCost : Int, attack : Int, defense : Int) {
        self.name = name
        self.magicPointCost = magicPointCost
        self.attack = attack
        self.defense = defense
        
    }
}
