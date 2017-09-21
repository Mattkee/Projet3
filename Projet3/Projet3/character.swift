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
            print("\(spell.spellNumber). le sort \(spell.name) qui permet : \(spell.attack) point de dommage.")
        }
    }
    
    // this method allow to check if character can use spell.
    func characterMinNeedMagic() {
       
        self.magicMinNeed = false
        
        for spell in self.spell {
            if self.magicMinNeed == true || spell.magicPointCost <= self.magic {
                self.magicMinNeed = true
            }
        }
    }
    
    // this method allows to add new object for character selected.
    func addCharacterObject () {
        
        if self.findTypeCharacter() == "mage" {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Tools.listHealsObjects.count)))
            
            if self.objects.count != 0 {
                self.magicMax -= self.objects[0].magic
            }
            
            self.objects.removeAll()
            
            self.objects.append(Tools.listHealsObjects[openChestNumber])
            
            Tools.checkThings(character: self, things: Tools.listHealsObjects[openChestNumber])
            
        } else {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Tools.listAttackObjects.count)))
            
            self.objects.removeAll()
            
            self.objects.append(Tools.listAttackObjects[openChestNumber])
            
            Tools.checkThings(character: self, things: Tools.listAttackObjects[openChestNumber])
            
        }
    }
    
    // this method will allow to add new spell for selected character.
    func addCharacterSpell () {
        
        let openChestNumber = Int(arc4random_uniform(UInt32(Tools.listAttackSpell.count)))
        
        self.magic += 50
        self.magicMax += 50
        
        var checkCharacterSpell : Bool = true
        
        for spell in self.spell {
            
            if Tools.listAttackSpell[openChestNumber].name == spell.name {
                checkCharacterSpell = false
            }
        }
        
        if checkCharacterSpell == true {
            
            self.spell.append(Tools.listAttackSpell[openChestNumber])
            self.spell[self.spell.count - 1].spellNumber = self.spell.count
            
        }
    
        
        Tools.checkThings(character: self, things: Tools.listAttackSpell[openChestNumber])
        
    }
    
    // this method will allow to select one spell's character to use it.
    func selectSpell() {
        
        self.seeCharacterSpell()
        
        print("")
        print("quel sort voulez vous choisir :")
        print("indiquez un nom de sort ou son numéro pour le sélectionner")
        
        if let choiceSpell = readLine() {
            
            for spell in self.spell {
                
                if choiceSpell == spell.name || choiceSpell == String(spell.spellNumber) {
                    self.spellSelected.append(spell)
                }
            }
        }
    }
    
    // This method puts in place the use of a magic spell selected phase.
    func castSpell (playerTwo : Player) {
        
        self.characterMinNeedMagic()
        var characterTwo : Any = ""
        
        if self.spell.count != 0 || self.magicMinNeed == true {
            while characterTwo is String {
                print("voulez vous attaquer ou lancer un sort ?"
                    + "\n1. attaquer"
                    + "\n2. lancer un sort")
                print("Ecrivez le numéro de l'action ou le nom de l'action")
                
                if let choiceAction = readLine() {
                    
                    if choiceAction == "2" || choiceAction == "lancer un sort" {
                        
                        repeat {
                            
                            while self.spellSelected.count == 0 {
                                self.selectSpell()
                            }
                            characterTwo = playerTwo.selectCharacter()
                            
                        } while characterTwo is Bool
                        
                        if let characterTwoSelected = characterTwo as? Character {
                            characterTwoSelected.health -= self.spellSelected[0].attack
                            
                            self.magic -= self.spellSelected[0].magicPointCost
                            
                            print("\(self.name) lance un sort à \(characterTwoSelected.name) et lui inflige \(self.spellSelected[0].attack) de dommage.")
                            
                            self.spellSelected.removeAll()
                        }
                        
                    } else if choiceAction == "1" || choiceAction == "attaquer" {
                        
                        while characterTwo is String {
                            repeat {
                                
                                characterTwo = playerTwo.selectCharacter()
                                
                            } while characterTwo is Bool
                            
                            if let characterTwoSelected = characterTwo as? Character {
                                self.attackPhase(characterTwo: characterTwoSelected)
                            }
                        }
                        
                    }
                }
            }
            self.magicMinNeed = false
        }
    }
    
    // This method will allow to carry out the phase of attack between two character.
    func attackPhase(characterTwo : Character) {
        
        characterTwo.health -= self.calculateDamage()
        
        if self.magicMax != 0 {
            self.magic += 20
            
            if self.magic > self.magicMax {
                self.magic = self.magicMax
            }
        }
        
        print("\(self.name) attaque \(characterTwo.name) et lui inflige \(self.calculateDamage()) point de dégat.")
    }
    
}
