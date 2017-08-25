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
    public static func selectCharacter (player : String) -> Character? {
        var characterSelected : Character
        
        print("lequel parmi vos personnage voulez vous choisir pour ce combat :")
        print("")
        for (name, type) in (game.players[player]?.getTeamCharacter())! {
            if type.characterNumber == 1 {
                print("\(type.characterNumber). le personnage \(name) qui est un \(Character.findCharacter(type: type))")
            }
        }
        for (name, type) in (game.players[player]?.getTeamCharacter())! {
            if type.characterNumber == 2 {
                print("\(type.characterNumber). le personnage \(name) qui est un \(Character.findCharacter(type: type))")
            }
        }
        for (name, type) in (game.players[player]?.getTeamCharacter())! {
            if type.characterNumber == 3 {
                print("\(type.characterNumber). le personnage \(name) qui est un \(Character.findCharacter(type: type))")
            }
        }
        repeat {
        if let choixPersonnage = readLine() {
            
            switch choixPersonnage {
            case "1":
                
                for (_, type) in (game.players[player]?.getTeamCharacter())! {
                    if type.characterNumber == 1 {
                        characterSelected = type
                        return characterSelected
                    }
                }
            case "2":
                
                for (_, type) in (game.players[player]?.getTeamCharacter())! {
                    if type.characterNumber == 2 {
                        characterSelected = type
                        return characterSelected
                    }
                }
            case "3":
                
                for (_, type) in (game.players[player]?.getTeamCharacter())! {
                    if type.characterNumber == 3 {
                        characterSelected = type
                        return characterSelected
                    }
                }
            default:
                
                print("")
                print("Je n'ai pas compris, veuillez choisir un numéro de 1 à 3 selon le personnage choisi.")
                }
            }
            return nil
        } while true
    }
}

