class Player{
    private var teamName : String = ""
    private var teamCharacter = [String : Character]()
// trouver le moyen de verifier la liste des noms dans le dictionnaire.

    public func setTeamName(name:String){
        self.teamName = name
    }
    public func getTeamName() -> String {
        return self.teamName
    }
    public func setTeamMember(name : String , member : Character) {
        self.teamCharacter[name] = member
    }
    public func getTeamMembersNumber() -> Int {
        return self.teamCharacter.count
    }
    // essayer de regarder comment afficher correctement le type.
    public func seeTeamMembers() {
        print("Voici la liste des ses personnages :")
        print("")
        for (name, type) in teamCharacter {
                if type is Warrior {
                    let characterType = "combattant"
                    print("le personnage \(name) qui est un \(characterType)")
                } else if type is Wizard {
                    let characterType = "mage"
                    print("le personnage \(name) qui est un \(characterType)")
                } else if type is Colossus {
                    let characterType = "colosse"
                    print("le personnage \(name) qui est un \(characterType)")
                } else {
                    let characterType = "nain"
                    print("le personnage \(name) qui est un \(characterType)")
                }
            }
    }
    
    public func playerName() -> String {
// trouver le moyen de verifier si le nom est déjà utilisé
        repeat{
            repeat { print("veuillez donner un nom correct de minimum 4 caractères.")
            if let setName = readLine(){
                self.teamName = String(setName)
            }
            } while (Player.checkName(nameChoice: teamName) == true)
        } while((teamName.characters.count) <= 3)
        
        return teamName
    }
    public static func checkName(nameChoice : String) -> Bool{
        for (name, _) in game.players {
            if nameChoice == name {
                return true
            } else {
                for (_, player) in game.players {
                    for (name , _) in player.teamCharacter {
                        if nameChoice == name {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
}
