class Character {
    // création des paramètres commun à tous les personnages.
    var name : String = ""
    var health : Int
    var attack : Int
    var magic : Int
    var characterNumber : Int = 0
    
    init(health : Int, attack : Int, magic : Int) {
        //self.name = ""
        self.health = health
        self.attack = attack
        self.magic = magic
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
    public static func viewCharacterBattle (player : String) {
        
        print("quel personnage voulez vous choisir pour ce combat :")
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
    }
    static func addNewCharacter(personnage : Character) {
        
        personnage.nameCharacter()
        personnage.characterNumber = game.players[game.selectPlayer]!.getTeamMembersNumber() + 1
        
        game.players[game.selectPlayer]!.setTeamMember(name : personnage.name , member: personnage)
        
        print("")
        print("\(game.players[game.selectPlayer]!.getTeamName()) a \(game.players[game.selectPlayer]!.getTeamMembersNumber()) personnage.")
        
        game.players[game.selectPlayer]!.seeTeamMembers()
        
    }
    static func selectCharacter(player : String) {
    
        print("indiquez un nom de personnage ou son numéro pour le sélectionner")
        if let choiceCharacter = readLine() {
        // optimiser la boucle for
            for (_, type) in (game.players[player]?.getTeamCharacter())! {
                if choiceCharacter == String(type.characterNumber) {
                        game.characterBattle.append(type)
                    } else if choiceCharacter == type.name {
                        game.characterBattle.append(type)
                }
            }
        }
    }
}

