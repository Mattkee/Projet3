import Foundation

// This class can manage any properties or methods that concern each character.
class Character {
    
    //Here are the parameters common to all characters
    var name : String = ""
    var health : Int
    var attack : Int
    var defense : Int = 0
    var magic : Int
    var magicMinNeed : Bool = false
    var magicMax : Int
    var characterNumber : Int = 0
    var objects = [Objects]()
    var spell = [Spell]()
    var spellSelected : Any = ""
    
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
            
            var totalAttackPoint : Int = 0
            
            for object in self.objects {
                totalAttackPoint += object.attack
            }
            
            let damage = self.attack + totalAttackPoint
            
            return damage
            
        } else {
            
            let damage = self.attack
            
            return damage
        }
    }
    
    // this method allows to return the total number of pt of defense of character's object total defense.
    func calculateDefense() -> Int {
        
        var totalDefenseObjectPoint : Int = 0
        for object in self.objects {
            totalDefenseObjectPoint += object.defense
        }
        
        let totalDefense = totalDefenseObjectPoint + self.defense
        
        return totalDefense
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
    
    // this method allows to add new object or spell for character selected.
    func addCharacterThings (things : String) {
        
        if things == "object" {
            if self.findTypeCharacter() == "mage" {
                
                var listObjectMagic = [Objects]()
                
                for object in Tools.listObjects {
                    if object is MagicObject {
                        listObjectMagic.append(object)
                    }
                }
                
                let openChestNumber = Int(arc4random_uniform(UInt32(listObjectMagic.count)))
            
                if self.objects.count != 0 {
                    self.magicMax -= self.objects[0].magic
                }
            
                self.objects.removeAll()
            
                self.objects.append(listObjectMagic[openChestNumber])
            
                Tools.checkThings(character: self, things: listObjectMagic[openChestNumber])
            
            } else {
                
                var listObject = [Objects]()
                
                for object in Tools.listObjects {
                    if object is AttackObject {
                        listObject.append(object)
                    }
                }
                
                let openChestNumber = Int(arc4random_uniform(UInt32(listObject.count)))
                
                if listObject[openChestNumber] is AttackObject {
                    var objectNumber : Int = 0
                    for object in self.objects {
                        
                        if object is AttackObject {
                            self.objects.remove(at: objectNumber)
                        }
                        objectNumber += 1
                    }
                }
                
                self.objects.append(listObject[openChestNumber])
            
                Tools.checkThings(character: self, things: listObject[openChestNumber])
            
            }
        } else if things == "spell" {
            let openChestNumber = Int(arc4random_uniform(UInt32(Tools.listSpell.count)))
            
            self.magic += 50
            self.magicMax += 50
            
            var checkCharacterSpell : Bool = true
            
            for spell in self.spell {
                
                if Tools.listSpell[openChestNumber].name == spell.name {
                    checkCharacterSpell = false
                }
            }
            
            if checkCharacterSpell == true {
                
                self.spell.append(Tools.listSpell[openChestNumber])
                self.spell[self.spell.count - 1].spellNumber = self.spell.count
                
            }
            
            
            Tools.checkThings(character: self, things: Tools.listSpell[openChestNumber])
        }
    }
    
    // This method puts in place the use of a magic spell selected phase.
    func castSpell (playerTwo : Player) {
        
        self.characterMinNeedMagic()
        var characterTwo : Any = ""
        
        if self.magicMinNeed == true {
            while characterTwo is String {
                print("voulez vous attaquer ou lancer un sort ?"
                    + "\n1. attaquer"
                    + "\n2. lancer un sort")
                print("Ecrivez le numéro de l'action ou le nom de l'action")
                
                if let choiceAction = readLine() {
                    
                    if choiceAction == "2" || choiceAction == "lancer un sort" {
                        
                        useSpell (playerTwo : playerTwo)
                        
                    } else if choiceAction == "1" || choiceAction == "attaquer" {
                        
                        while characterTwo is String {
                            repeat {
                                
                                characterTwo = Tools.select(wantSelect: playerTwo)
                                
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
        
        characterTwo.health -= (self.calculateDamage() - characterTwo.calculateDefense())
        
        if self.magicMax != 0 {
            self.magic += 20
            
            if self.magic > self.magicMax {
                self.magic = self.magicMax
            }
        }
        
        print("\(self.name) attaque \(characterTwo.name) et lui inflige \(self.calculateDamage()) point de dégat.")
    }
    
    // this method allow to use Attack Spell.
    func useSpell (playerTwo : Player) {
        var characterTwo : Any = ""
        
        while self.spellSelected is String || self.spellSelected is Bool {
            
            self.spellSelected = Tools.select(wantSelect: self)
            
        }
        
        if self.spellSelected is AttackSpell {
            repeat {
            
                characterTwo = Tools.select(wantSelect: playerTwo)
            
            } while characterTwo is Bool
        
            if let characterTwoSelected = characterTwo as? Character {
            
                if let useSpell = self.spellSelected as? Spell {
                
                    characterTwoSelected.health -= useSpell.attack
                
                    self.magic -= useSpell.magicPointCost
                
                    print("\(self.name) lance un sort à \(characterTwoSelected.name) et lui inflige \(useSpell.attack) de dommage.")
                
                    self.spellSelected = ""
                }
            }
            
        } else if self.spellSelected is DefenseSpell {
            
            if let totalDefense = spellSelected as? DefenseSpell {
                self.defense += totalDefense.defenseSpellProtection
                
                var spellNumber = 0
                for checkSpell in self.spell {
                    if checkSpell.name == totalDefense.name {
                        self.spell.remove(at: spellNumber)
                        return
                    }
                    spellNumber += 1
                }
            }
        }
    }
}
