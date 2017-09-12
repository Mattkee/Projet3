import Foundation

// This class can manage any properties or methods that concern each character.
class Character {
    
    //Here are the parameters common to all characters
    var name : String = ""
    var health : Int
    var attack : Int
    var magic : Int
    var magicMax : Int
    var characterNumber : Int = 0
    var objects = [Objects]()
    var spell = [Spell]()
    var spellSelected = [Spell]()
    
    init(health : Int, attack : Int, magic : Int, magicMax : Int) {
        
        self.health = health
        self.attack = attack
        self.magic = magic
        self.magicMax = magicMax
    }
    
    // This method will allow to check the name chosen by the player for the character.
    func nameCharacter() {
        
        repeat{
            repeat {
                print("veuillez donner un nom correct de minimum 4 caractères.")
                if let setName = readLine(){
                    self.name = String(setName)
                }
            } while (Player.checkName(nameChoice: name) == true)
        } while((name.characters.count) <= 3)
    }
    
    // this method find character type and return french translate.
    public static func findCharacter(type : Character) -> String {
        
        if type is Warrior {
            return "combattant"
            
        } else if type is Wizard {
            return "mage"
            
        } else if type is Colossus {
            return "colosse"
            
        } else {
            return "nain"
            
        }
    }
    
    // This method allows to define what is the maximum number of life to a character type.
    public static func charactersHealth(characterType : Character) -> Int {
        
        if characterType is Warrior {
            
            let characterHealthMax = 100
            return characterHealthMax
            
        } else if characterType is Wizard {
            
            let characterHealthMax = 60
            return characterHealthMax
            
        } else if characterType is Colossus {
            
            let characterHealthMax = 500
            return characterHealthMax
            
        } else {
            
            let characterHealthMax = 30
            return characterHealthMax
        }
    }
    
    // This method allows to define the total number of pt of attack of a character, including his point of attack accumulates with the point of attack from character object.
    static func calculateDamage(characterSelected : Character) -> Int {
        if characterSelected.objects.count == 1 {
            
            let damage = characterSelected.attack + characterSelected.objects[0].attack
            
            return damage
            
        } else {
            
            let damage = characterSelected.attack
            
            return damage
        }
    }
    
    func seeCharacterSpell(characterSelected : Character) {
        print("Voici la liste des sorts de \(characterSelected.name) :")
        print("")
        print("choisissez un sort")
        print("")
        for spell in characterSelected.spell {
            print("\(spell.spellNumber + 1). le sort \(spell.name) qui permet : \(spell.attack) point de dommage.")
        }
    }
}
