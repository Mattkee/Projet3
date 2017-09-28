import Foundation

// This class will allow to set the property of the wizard type character.
class Wizard : Character {
    
    // This method will allow the character of type wizard to heal or attack.
    func heals (playerOne : Player , playerTwo : Player , characterOneSelected: Character) {
        
        var characterneedHeals : Any = ""
        
        while characterneedHeals is String {
            print("voulez vous soigner un de vos personnage ou attaquer ?"
                + "\n1. soigner"
                + "\n2. attaquer")
            
            
            if let choiceAction = readLine() {
                
                if choiceAction == "1" || choiceAction == "soigner" {
                    
                    repeat {
                        print("quel personnage voulez vous soigner :")
                        
                        characterneedHeals = Tools.select(wantSelect: playerOne)
                        
                    } while characterneedHeals is Bool
                    
                    if let characterTwoSelected = characterneedHeals as? Character {
                        
                        let characterHealthMax = characterTwoSelected.healthMax
                        
                        characterTwoSelected.health += 20
                        characterOneSelected.magic -= 20
                        
                        if characterHealthMax < characterTwoSelected.health {
                            
                            characterTwoSelected.health = characterHealthMax
                            
                        }
                        
                        print("\(characterOneSelected.name) soigne \(characterTwoSelected.name)")
                        
                    }
                    
                    
                } else if choiceAction == "2" || choiceAction == "attaquer" {
                    
                    characterneedHeals = true
                    
                    characterOneSelected.castSpell(playerTwo: playerTwo)
                    
                }
            }
        }
    }

    init(){
        super.init(health: 60, attack: 2, magic: 100, magicMax : 100, type : "mage", healthMax: 60)
        
        self.magic = magic
        
    }
}
