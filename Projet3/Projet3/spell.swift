import Foundation

// This class to set the properties and methods of the spells of the game.
class Spell {
    
    var name : String
    var magicPointCost : Int
    var attack : Int
    var spellNumber : Int = 0
    
    init(name: String , magicPointCost : Int, attack : Int) {
        self.name = name
        self.magicPointCost = magicPointCost
        self.attack = attack
        
    }
    
    // this array contain the list of different Attack spells.
    static var listAttackSpell = [
        
        AttackSpell(name: "boule de feu", magicPointCost: 20, attackSpellDamage: 25),
        AttackSpell(name: "éclair de glace", magicPointCost: 25, attackSpellDamage: 30)
    ]
    
    static func checkSpellType (characterSelected : Character) {
        
        for spell in characterSelected.spell {
            
            if let attackSpell = spell as? AttackSpell {
                
                print("\(characterSelected.name) reçoit le sort de combat \(characterSelected.spell[0].name) qui lui donne \(attackSpell.attackSpellDamage)")
                print("")
                
            }
        }
    }
    
    static func addCharacterSpell (characterSelected : Character) {
        
        let openChestNumber = Int(arc4random_uniform(UInt32(Spell.listAttackSpell.count)))
        
        characterSelected.spell.removeAll()
        
        characterSelected.spell.append(Spell.listAttackSpell[openChestNumber])
        
        Spell.checkSpellType(characterSelected: characterSelected)
    }
    
    static func selectSpell(characterSelected : Character) {
        
        
        characterSelected.seeCharacterSpell(characterSelected: characterSelected)
        
        print("quel sort voulez vous choisir :")
        print("")
        
        print("indiquez un nom de sort ou son numéro pour le sélectionner")
        
        if let choiceSpell = readLine() {
            
            for spell in characterSelected.spell {
                
                if choiceSpell == spell.name || choiceSpell == String(spell.spellNumber + 1) {
                    characterSelected.spellSelected.append(spell)
                }
            }
        }
    }
    
    func castSpell (playerAttack: Player, playerDefender : Player, characterSelected : Character) {
        if characterSelected.spell.count != 0 {
            while game.characterBattle.count == 1 {
                print("voulez vous attaquer ou lancer un sort ?"
                + "\n1. attaquer"
                + "\n2. lancer un sort")
                print("Ecrivez le numéro de l'action ou le nom de l'action")
            
                if let choiceAction = readLine() {
                
                    if choiceAction == "2" || choiceAction == "lancer un sort" {
                    
                        while game.characterBattle.count != 2 {
                            print("quel sort voulez vous utiliser :")
                            while characterSelected.spellSelected.count == 0 {
                              Spell.selectSpell(characterSelected: characterSelected)
                            }
                            Player.selectCharacter(player : playerDefender)
                        }
                    
                        playerDefender.teamCharacter[game.characterBattle[1].characterNumber].health -= characterSelected.spellSelected[0].attack
                    
                    
                        print("\(game.characterBattle[0].name) lance un sort à \(game.characterBattle[1].name) et lui inflige \(characterSelected.spellSelected[0].attack) de dommage.")
                        
                        characterSelected.spell.removeAll()
                        game.characterBattle.removeAll()
                    
                    } else if choiceAction == "1" || choiceAction == "attaquer" {
                    
                        while game.characterBattle.count != 2 {
                        Player.selectCharacter(player: playerDefender)
                        }
                        Player.attackPhase(playerOne: playerAttack, playerTwo: playerDefender)
                    
                        print("Le combat opposera \(game.characterBattle[0].name) à \(game.characterBattle[1].name)")
                    
                    
                        game.characterBattle.removeAll()
                    }
                    Player.remoteCharacter()
                    Player.remotePlayer()
                }
            }
        }
    }
}
