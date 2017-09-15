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
    
    // this method will allow to select one spell's character to use it.
    static func selectSpell(characterSelected : Character) {
        
        characterSelected.seeCharacterSpell(characterSelected: characterSelected)
        
        print("")
        print("quel sort voulez vous choisir :")
        print("indiquez un nom de sort ou son numéro pour le sélectionner")
        
        if let choiceSpell = readLine() {
            
            for spell in characterSelected.spell {
                
                if choiceSpell == spell.name || choiceSpell == String(spell.spellNumber + 1) {
                    characterSelected.spellSelected.append(spell)
                }
            }
        }
    }
    
    // This method puts in place the use of a magic spell selected phase. 
    static func castSpell (playerOne: Player, playerTwo : Player, characterSelected : Character) {
        
        characterSelected.characterMinNeedMagic(characterSelected: characterSelected)
        
        if characterSelected.spell.count != 0 || characterSelected.magicMinNeed == true {
            while game.characterBattle.count == 1 {
                print("voulez vous attaquer ou lancer un sort ?"
                + "\n1. attaquer"
                + "\n2. lancer un sort")
                print("Ecrivez le numéro de l'action ou le nom de l'action")
            
                if let choiceAction = readLine() {
                
                    if choiceAction == "2" || choiceAction == "lancer un sort" {
                    
                        while game.characterBattle.count != 2 {
                            
                            while characterSelected.spellSelected.count == 0 {
                              Spell.selectSpell(characterSelected: characterSelected)
                            }
                            playerTwo.selectCharacter()
                        }
                    
                        playerTwo.teamCharacter[game.characterBattle[1].characterNumber].health -= characterSelected.spellSelected[0].attack
                        characterSelected.magic -= characterSelected.spellSelected[0].magicPointCost
                    
                        print("\(game.characterBattle[0].name) lance un sort à \(game.characterBattle[1].name) et lui inflige \(characterSelected.spellSelected[0].attack) de dommage.")
                        
                        characterSelected.spellSelected.removeAll()
                        game.characterBattle.removeAll()
                    
                    } else if choiceAction == "1" || choiceAction == "attaquer" {
                    
                        while game.characterBattle.count != 2 {
                        playerTwo.selectCharacter()
                        }
                        game.attackPhase(playerOne: playerOne, playerTwo: playerTwo)
                    
                        print("Le combat a opposé \(game.characterBattle[0].name) à \(game.characterBattle[1].name)")
                    
                    
                        game.characterBattle.removeAll()
                    }
                    
                    Player.remoteCharacter()
                    game.remotePlayer()
                }
            }
        }
        
        characterSelected.magicMinNeed = false
    }
}
