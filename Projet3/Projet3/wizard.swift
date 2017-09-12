import Foundation

// This class will allow to set the property of the wizard type character.
class Wizard : Character {
    
    // This method will allow the character of type wizard to heal or attack.
    static func WizardHeals (playerOne : Player , playerTwo : Player , wizardHeals: Character) {
        
        //If the type of the selected character is a wizard the player can choose if he wants to heal or attack.
        if Character.findCharacter(type: wizardHeals) == "mage" {
            
            while game.characterBattle.count == 1 {
                print("voulez vous soigner un de vos personnage ou attaquer ?"
                    + "\n1. Attaquer"
                    + "\n2. Soigner")
                print("Ecrivez le numéro de l'action ou le nom de l'action")
        
                if let choiceAction = readLine() {
            
                    if choiceAction == "2" || choiceAction == "soigner" {
                
                        while game.characterBattle.count != 2 {
                            print("quel personnage voulez vous soigner :")
                            
                            Player.selectCharacter(player : playerOne)
                        }
                
                        let characterHealthMax = Character.charactersHealth(characterType : game.characterBattle[1])
                
                        playerOne.teamCharacter[game.characterBattle[1].characterNumber].health += 20
                        wizardHeals.magic -= 20
                
                        if characterHealthMax < game.characterBattle[1].health {
                    
                            playerOne.teamCharacter[game.characterBattle[1].characterNumber].health = characterHealthMax
                    
                        }
                
                        print("\(game.characterBattle[0].name) soigne \(game.characterBattle[1].name)")
                
                        game.characterBattle.removeAll()
                
                    } else if choiceAction == "1" || choiceAction == "attaquer" {
                        
                        Spell.castSpell(playerOne: playerOne, playerTwo: playerTwo, characterSelected: game.characterBattle[0])
                        
                        if game.characterBattle.count == 1 {
                            while game.characterBattle.count == 1 {
                                Player.selectCharacter(player: playerTwo)
                            }
                            Player.attackPhase(playerOne: playerOne, playerTwo: playerTwo)
                            print("Le combat a opposé \(game.characterBattle[0].name) à \(game.characterBattle[1].name)")
                        }
                        
                
                        game.characterBattle.removeAll()
                    }
                    Player.removeCharacter()
                    Player.removePlayer()
                }
            }
        }
    }

    init(){
        super.init(health: 60, attack: 2, magic: 100, magicMax : 100)
        
        self.magic = magic
        
    }
}
