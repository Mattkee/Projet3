import Foundation

// This class can manage any properties or methods that concern each character.
class Character {
    
    //Here are the parameters common to all characters
    var name : String = ""
    var health : Int
    var attack : Int
    var magic : Int
    var magicMinNeed : Bool = false
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
            } while (game.checkName(nameChoice: name) == true)
        } while((name.characters.count) <= 3)
    }
    
    // this method find character type and return french translate.
    func findTypeCharacter() -> String {
        
        if self is Warrior {
            return "combattant"
            
        } else if self is Wizard {
            return "mage"
            
        } else if self is Colossus {
            return "colosse"
            
        } else {
            return "nain"
            
        }
    }
    
    // This method allows to define what is the maximum number of life to a character type.
    func charactersHealth() -> Int {
        
        if self is Warrior {
            
            let characterHealthMax = 100
            return characterHealthMax
            
        } else if self is Wizard {
            
            let characterHealthMax = 60
            return characterHealthMax
            
        } else if self is Colossus {
            
            let characterHealthMax = 500
            return characterHealthMax
            
        } else {
            
            let characterHealthMax = 30
            return characterHealthMax
        }
    }
    
    // This method allows to define the total number of pt of attack of a character, including his point of attack accumulates with the point of attack from character object.
    func calculateDamage() -> Int {
        if self.objects.count == 1 {
            
            let damage = self.attack + self.objects[0].attack
            
            return damage
            
        } else {
            
            let damage = self.attack
            
            return damage
        }
    }
    
    // this method allows to display all character selected's spell.
    func seeCharacterSpell(characterSelected : Character) {
        print("Voici la liste des sorts de \(characterSelected.name) :")
        print("")
        print("choisissez un sort")
        print("")
        for spell in characterSelected.spell {
            print("\(spell.spellNumber + 1). le sort \(spell.name) qui permet : \(spell.attack) point de dommage.")
        }
    }
    
    // this method allow to check if character can use spell.
    func characterMinNeedMagic(characterSelected : Character) {
       
       for spell in characterSelected.spell {
            if characterSelected.magicMinNeed == true || spell.magicPointCost <= characterSelected.magic {
                characterSelected.magicMinNeed = true
            }
        }
    }
    
    // this method allows to add new object for character selected.
    func addCharacterObject (characterSelected : Character) {
        
        if characterSelected.findTypeCharacter() == "mage" {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Objects.listHealsObjects.count)))
            
            if characterSelected.objects.count != 0 {
                characterSelected.magicMax -= characterSelected.objects[0].magic
            }
            
            characterSelected.objects.removeAll()
            
            characterSelected.objects.append(Objects.listHealsObjects[openChestNumber])
            
            Objects.checkObjetsType(characterSelected: characterSelected)
            
        } else {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Objects.listAttackObjects.count)))
            
            characterSelected.objects.removeAll()
            
            characterSelected.objects.append(Objects.listAttackObjects[openChestNumber])
            
            Objects.checkObjetsType(characterSelected: characterSelected)
            
        }
    }
    
    // this method will allow to add new spell for selected character.
    func addCharacterSpell (characterSelected : Character) {
        
        let openChestNumber = Int(arc4random_uniform(UInt32(Spell.listAttackSpell.count)))
        
        characterSelected.magic += 50
        characterSelected.magicMax += 50
        
        characterSelected.spell.append(Spell.listAttackSpell[openChestNumber])
        
        Spell.checkSpellType(characterSelected: characterSelected, newSpell: Spell.listAttackSpell[openChestNumber])
        
    }
    
    // this method will allow to select one spell's character to use it.
    func selectSpell() {
        
        self.seeCharacterSpell(characterSelected: self)
        
        print("")
        print("quel sort voulez vous choisir :")
        print("indiquez un nom de sort ou son numéro pour le sélectionner")
        
        if let choiceSpell = readLine() {
            
            for spell in self.spell {
                
                if choiceSpell == spell.name || choiceSpell == String(spell.spellNumber + 1) {
                    self.spellSelected.append(spell)
                }
            }
        }
    }
    
}
