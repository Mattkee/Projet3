class Character {
    // création des paramètres commun à tous les personnages.
    var name : String = ""
    var health : Int
    var attack : Int
    var characterNumber : Int = 0
    
    init(health : Int, attack : Int) {
        //self.name = ""
        self.health = health
        self.attack = attack
    }
    func nameCharacter() {
        // trouver le moyen de verifier si le nom est déjà utilisé
        repeat{
            repeat {
            print("veuillez donner un nom correct de minimum 4 caractères.")
            if let setName = readLine(){
                self.name = String(setName)
            }
            } while (Player.checkName(nameChoice: name) == true)
        } while((name.characters.count) <= 3)
    }
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
}
