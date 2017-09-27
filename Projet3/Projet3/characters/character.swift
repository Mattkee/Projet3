import Foundation

// This class can manage any properties or methods that concern each character.
class Character {
    
    //Here are the parameters common to all characters
    var name : String = ""
    var health : Int
    let healthMax : Int
    var attack : Int
    var defense : Int = 0
    var magic : Int
    let type : String
    var magicMinNeed : Bool = false
    var magicMax : Int
    var characterNumber : Int = 0
    
    var objects = [String : Objects]()
    var spells = [String : Spell]()
    var spellSelected : Any = ""
    
    init(health : Int, attack : Int, magic : Int, magicMax : Int, type : String, healthMax : Int) {
        
        self.health = health
        self.healthMax = healthMax
        self.attack = attack
        self.magic = magic
        self.type = type
        self.magicMax = magicMax
    }
    
    // This method allows to define the total number of pt of attack of a character, including his point of attack accumulates with the point of attack from character object.
    func calculateDamage() -> Int {
        if self.objects.count != 0 {
            
            var totalAttackPoint : Int = 0
            
            for (_ , object) in self.objects {
                if object is AttackObject {
                totalAttackPoint += object.attack
                }
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
        for (_ , object) in self.objects {
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
        
        let viewSpell = self.spells.values.sorted(by: ({ $1.spellNumber > $0.spellNumber }))
    
        for spell in viewSpell {
            print("\(spell.spellNumber). le sort \(spell.name) qui permet : \(spell.attack) point de dommage.")
        }
    }
    
    // this method allow to check if character can use spell.
    func characterMinNeedMagic() {
       
        self.magicMinNeed = false
        
        for (_ , spell) in self.spells {
            
            if spell.magicPointCost <= self.magic {
                self.magicMinNeed = true
            }
        }
    }
    
    // this method allows to add new object for character selected.
    func addCharacterObject () {
        
        if self.type == "mage" {
                
            var listObjectMage = [Objects]()
                
            for object in Tools.listObjects {
                if object is MagicObject || object is DefenseObject {
                    listObjectMage.append(object)
                }
            }
                
            let openChestNumber = Int(arc4random_uniform(UInt32(listObjectMage.count)))
            
            if self.objects.count != 0 && listObjectMage[openChestNumber] is MagicObject {
                for (_ , object) in self.objects {
                    if object is MagicObject {
                        self.magicMax -= object.magic
                    }
                }
            }
            
            self.objects[listObjectMage[openChestNumber].type] = listObjectMage[openChestNumber]
            
            Tools.checkThings(character: self, things: listObjectMage[openChestNumber])
            
        } else {
                
            var listObject = [Objects]()
                
            for object in Tools.listObjects {
                if object is AttackObject || object is DefenseObject {
                    listObject.append(object)
                }
            }
                
            let openChestNumber = Int(arc4random_uniform(UInt32(listObject.count)))
            
            self.objects[listObject[openChestNumber].type] = listObject[openChestNumber]
            
            Tools.checkThings(character: self, things: listObject[openChestNumber])
            
        }
    }
    
    // this method allows to add new Spell for character selected.
    func addCharacterSpell() {
            
        let openChestNumber = Int(arc4random_uniform(UInt32(Tools.listSpell.count)))
            
        self.magic += 50
        self.magicMax += 50
        
        if self.spells[Tools.listSpell[openChestNumber].name]?.name == Tools.listSpell[openChestNumber].name {
            
            Tools.checkThings(character: self, things: Tools.listSpell[openChestNumber])
            
        } else {
            self.spells[Tools.listSpell[openChestNumber].name] = Tools.listSpell[openChestNumber]
            let spellNumber = self.spells.count
            self.spells[Tools.listSpell[openChestNumber].name]?.spellNumber = spellNumber
            
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
                        characterTwo = true
                        
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
        } else {
            
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
    
    // This method will allow to carry out the phase of attack between two character.
    func attackPhase(characterTwo : Character) {
        var damage = self.calculateDamage() - characterTwo.calculateDefense()
        if damage < 0 {
            damage = 0
        }
        characterTwo.health -= damage
        
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
                print("\(self.name) lance l'enchantement \(totalDefense.name) qui ajoute \(totalDefense.defenseSpellProtection) pt à sa défense")
                
                for (name , _ ) in self.spells {
                    if name == totalDefense.name {
                        self.spells.removeValue(forKey: name)
                    }
                }
                self.spellSelected = ""
            }
        }
    }

}
