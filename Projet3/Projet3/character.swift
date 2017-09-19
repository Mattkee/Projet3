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
    func nameCharacter(players : [Player]) {
        let player = Player()
        repeat{
            repeat {
                print("veuillez donner un nom correct de minimum 4 caractères.")
                if let setName = readLine(){
                    self.name = String(setName)
                }
            } while (player.checkName(nameChoice: name, players : players) == true)
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
    func seeCharacterSpell() {
        print("Voici la liste des sorts de \(self.name) :")
        print("")
        print("choisissez un sort")
        print("")
        for spell in self.spell {
            print("\(spell.spellNumber + 1). le sort \(spell.name) qui permet : \(spell.attack) point de dommage.")
        }
    }
    
    // this method allow to check if character can use spell.
    func characterMinNeedMagic() {
       
       for spell in self.spell {
            if self.magicMinNeed == true || spell.magicPointCost <= self.magic {
                self.magicMinNeed = true
            }
        }
    }
    
    // this method allows to add new object for character selected.
    func addCharacterObject () {
        
        if self.findTypeCharacter() == "mage" {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Objects.listHealsObjects.count)))
            
            if self.objects.count != 0 {
                self.magicMax -= self.objects[0].magic
            }
            
            self.objects.removeAll()
            
            self.objects.append(Objects.listHealsObjects[openChestNumber])
            
            checkObjetsType()
            
        } else {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Objects.listAttackObjects.count)))
            
            self.objects.removeAll()
            
            self.objects.append(Objects.listAttackObjects[openChestNumber])
            
            checkObjetsType()
            
        }
    }
    
    // this method will allow to add new spell for selected character.
    func addCharacterSpell () {
        
        let openChestNumber = Int(arc4random_uniform(UInt32(Spell.listAttackSpell.count)))
        
        self.magic += 50
        self.magicMax += 50
        
        var checkCharacterSpell : Bool = false
        
        for spell in self.spell {
            
            if Spell.listAttackSpell[openChestNumber].name == spell.name {
                checkCharacterSpell = true
            }
        }
        
        if checkCharacterSpell == true {
            
            self.spell.append(Spell.listAttackSpell[openChestNumber])
            self.spell[self.spell.count - 1].spellNumber = self.spell.count
            
        }
    
        
        Spell.checkSpellType(characterSelected: self, newSpell: Spell.listAttackSpell[openChestNumber])
        
    }
    
    // this method will allow to select one spell's character to use it.
    func selectSpell() {
        
        self.seeCharacterSpell()
        
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
    
    // this method allow to define type of selected character's object.
    func checkObjetsType () {
        
        for object in self.objects {
            
            if let attackObject = object as? AttackObject {
                
                print("\(self.name) reçoit l'objet \(self.objects[0].name) qui lui donne \(attackObject.attackDamage)")
                print("")
                
            } else if let magicObject = object as? MagicObject {
                
                self.magicMax += magicObject.magicPoint
                
                print("\(self.name) reçoit l'objet \(self.objects[0].name) qui lui donne \(magicObject.magicPoint)")
                print("")
                
            }
        }
    }
}
