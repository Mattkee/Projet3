import Foundation

// This class will allow to set the property of the wizard type character.
class Wizard : Character {
    
    // This method will allow the character of type wizard to heal or attack.
    static func WizardHeals (playerAttack : Player , playerDefender : Player , wizardHeals: Character) {
        
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
                            
                            Player.selectCharacter(player : playerAttack)
                        }
                
                        let characterHealthMax = Character.charactersHealth(characterType : game.characterBattle[1])
                
                        playerAttack.teamCharacter[game.characterBattle[1].characterNumber].health += 20
                        wizardHeals.magic -= 20
                
                        if characterHealthMax < game.characterBattle[1].health {
                    
                            playerAttack.teamCharacter[game.characterBattle[1].characterNumber].health = characterHealthMax
                    
                        }
                
                        print("\(game.characterBattle[0].name) soigne \(game.characterBattle[1].name)")
                
                        game.characterBattle.removeAll()
                
                    } else if choiceAction == "1" || choiceAction == "attaquer" {
                        
                        Spell.castSpell(playerOne: playerAttack, playerTwo: playerDefender, characterSelected: game.characterBattle[0])
                        while game.characterBattle.count != 2 {
                            Player.selectCharacter(player: playerDefender)
                        }
                        Player.attackPhase(playerOne: playerAttack, playerTwo: playerDefender)
                
                        print("Le combat a opposé \(game.characterBattle[0].name) à \(game.characterBattle[1].name)")
                
                
                        game.characterBattle.removeAll()
                    }
                    Player.remoteCharacter()
                    Player.remotePlayer()
                }
            }
        }
    }

    init(){
        super.init(health: 60, attack: 2, magic: 100, magicMax : 100)
        
        self.magic = magic
        
    }
}
