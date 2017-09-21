import Foundation

// This class includes any methods or properties that can be used independently of a character or a player.
class Tools {
    
    // this method allow to check if the name is already use for players or characters.
    static func checkName(nameChoice : String, players : [Player]) -> Bool{
        
        // this loop will observe players name.
        for player in players {
            
            if nameChoice.lowercased() == player.teamName.lowercased() {
                return true
            } else {
                
                // this loop will observe all characters name.
                for character in player.teamCharacter {
                    if nameChoice.lowercased() == character.name.lowercased() {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    // this method will allow to choice a name for player or character.
    static func choiceName(players : [Player]) -> String {
        
        var name : String = ""
            repeat{
                repeat {
                    print("veuillez donner un nom correct de minimum 4 caractères.")
                    if let setName = readLine(){
                        name = String(setName)
                    }
                } while (Tools.checkName(nameChoice: name, players : players) == true)
            } while((name.characters.count) <= 3)
        return name
    }
    
    // this method allow to define type of selected character's object or spell.
    static func checkThings (character : Character, things : Any) {
        
        if things is Objects {
            for object in character.objects {
            
                if let attackObject = object as? AttackObject {
                
                    print("\(character.name) reçoit l'objet \(character.objects[0].name) qui lui donne \(attackObject.attackDamage)")
                    print("")
                
                } else if let magicObject = object as? MagicObject {
                
                    character.magicMax += magicObject.magicPoint
                
                    print("\(character.name) reçoit l'objet \(character.objects[0].name) qui lui donne \(magicObject.magicPoint)")
                    print("")
                
                }
            }
        } else {
            
            for spell in character.spell {
                
                if let attackSpell = spell as? AttackSpell {
                    
                    print("\(character.name) reçoit le sort de combat \(spell.name) qui lui donne \(attackSpell.attackSpellDamage)")
                    print("")
                    
                }
            }
        }
    }
    
    // this propertie contains lot of attack objet for the random choice of the chest.
    static let listAttackObjects = [
        AttackObject(name: "épée simple", attackDamage: 10),
        AttackObject(name: "hache simple", attackDamage: 50),
        AttackObject(name: "épée lourde", attackDamage: 20),
        ]
    
    // this propertie contains lot of magic objet for the random choice of the chest.
    static let listHealsObjects = [
        MagicObject(name: "baguette", magicPoint: 30)
    ]
    
    // this array contain the list of different Attack spells.
    static var listAttackSpell = [
        AttackSpell(name: "boule de feu", magicPointCost: 20, attackSpellDamage: 25),
        AttackSpell(name: "éclair de glace", magicPointCost: 25, attackSpellDamage: 30)
    ]
}
