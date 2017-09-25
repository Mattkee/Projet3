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
            
            if let attackObject = things as? AttackObject {
                
                    print("\(character.name) reçoit l'objet \(attackObject.name) qui lui donne \(attackObject.attackDamage)")
                    print("")
                
            } else if let magicObject = things as? MagicObject {
                
                    character.magicMax += magicObject.magicPoint
                
                    print("\(character.name) reçoit l'objet \(magicObject.name) qui lui donne \(magicObject.magicPoint)")
                    print("")
                
            }
        } else {
                
            if let attackSpell = things as? AttackSpell {
                    
                    print("\(character.name) reçoit le sort de combat \(attackSpell.name) qui utilisé lui permettra d'infliger \(attackSpell.attackSpellDamage) pt de dommage à son adversaire.")
                    print("")
                    
            }
            
            if let defenseSpell = things as? DefenseSpell {
                
                print("\(character.name) reçoit le sort de défense \(defenseSpell.name) qui utilisé ajoutera \(defenseSpell.defenseSpellProtection) à ses pts de défense.")
                print("")
                
            }
        }
    }
    
    // this method allow to select character or spell.
    static func select (wantSelect : Any) -> Any {
        
        if wantSelect is Player {
            if let player = wantSelect as? Player {
                
                player.seeTeamMembers()
            
                print("quel personnage voulez vous choisir :")
                print("")
            
                print("indiquez un nom de personnage ou son numéro pour le sélectionner")
            
                if let choiceCharacter = readLine() {
                
                    for character in player.teamCharacter {
                    
                        if choiceCharacter == character.name || choiceCharacter == String(character.characterNumber + 1) {
                        return character
                        }
                    }
                }
            }
        } else {
            
            if let character = wantSelect as? Character {
                
                character.seeCharacterSpell()
            
                print("")
                print("quel sort voulez vous choisir :")
                print("indiquez un nom de sort ou son numéro pour le sélectionner")
            
                if let choiceSpell = readLine() {
                
                    for spell in character.spell {
                    
                        if choiceSpell == spell.name || choiceSpell == String(spell.spellNumber) {
                            return spell
                        }
                    }
                }
            }
        }
        
        print("je n'ai pas compris")
        return false
    }
    
    // this propertie contains lot of attack objet for the random choice of the chest.
    static let listObjects = [
        AttackObject(name: "épée simple", attackDamage: 15),
        AttackObject(name: "hache simple", attackDamage: 20),
        AttackObject(name: "épée lourde", attackDamage: 20),
        AttackObject(name: "lance", attackDamage: 15),
        AttackObject(name: "hache lourde", attackDamage: 50),
        AttackObject(name: "sabre", attackDamage: 25),
        MagicObject(name: "baguette", magicPoint: 30),
        MagicObject(name: "baguette d'ébene", magicPoint: 40),
        MagicObject(name: "baguette lumineuse", magicPoint: 50),
        MagicObject(name: "baguette de feu", magicPoint: 45),
        MagicObject(name: "baguette de glace", magicPoint: 35),
        DefenseObject(name: "armure de cuir", defensePoint: 20),
        DefenseObject(name: "armure de fer", defensePoint: 30),
        DefenseObject(name: "armure d'acier", defensePoint: 40),
        DefenseObject(name: "armure d'or", defensePoint: 50)
        ]
    
    
    // this array contain the list of different Attack spells.
    static var listSpell = [
        AttackSpell(name: "boule de feu", magicPointCost: 20, attackSpellDamage: 25),
        AttackSpell(name: "éclair de glace", magicPointCost: 25, attackSpellDamage: 30),
        AttackSpell(name: "foudre", magicPointCost: 30, attackSpellDamage: 35),
        AttackSpell(name: "explosion", magicPointCost: 35, attackSpellDamage: 40),
        DefenseSpell(name: "Armure magique", magicPointCost: 50, defenseSpellProtection: 15)
    ]
}
