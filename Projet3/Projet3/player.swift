class Player{
    private var teamName : String = ""
    private var teamCharacter = [String : Character]()

    public func setTeamName(name:String){
        self.teamName = name
    }
    public func getTeamName() -> String {
        return self.teamName
    }
    public func getTeamCharacter() -> [String : Character]{
        return self.teamCharacter
    }
    public func setTeamMember(name : String , member : Character) {
        self.teamCharacter[name] = member
    }
    public func getTeamMembersNumber() -> Int {
        return self.teamCharacter.count
    }
    public func seeTeamMembers() {
        print("Voici la liste des ses personnages :")
        print("")
        for (name, type) in teamCharacter {
                print("le personnage \(name) qui est un \(Character.findCharacter(type: type))")
            }
    }
    public static func remoteCharacter() {
        for player in game.players.values {
            for (nameCharacter, type) in player.teamCharacter {
                if type.health < 1 {
                    player.teamCharacter.removeValue(forKey: nameCharacter)
                }
            }
        }
    }
    
    public static func seeAllTeamCharacter() {
        for (name, _) in game.players {
            print("")
            print("pour l'équipe de \(name) voici la liste des personnages :")
            print("")
            for player in game.players.values {
                for (nameCharacter, type) in player.teamCharacter {
                    if player.teamName == name {
                        print("le personnage \(nameCharacter) qui est un \(Character.findCharacter(type: type))")
                    }
                }
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
    public static func initializeTeamsName(playerNumber : Int){
        
        let team = Player()
        
        print("Joueur \(playerNumber + 1) Quel est le nom de votre equipe")
        
        let teamName = team.playerName()
        
        team.setTeamName(name : teamName)
        game.players[teamName] = team
        game.playersName.append(teamName)
        
        game.selectPlayer = game.playersName[playerNumber]
        
        // changer la boucle pour qu'elle soit plus compréhensible, en démarrant de 1 et en changer l'appelation i.
        print("")
        for i in 1 ... (game.players.count){
            game.selectPlayer = game.playersName[i - 1]
            print("Le joueur \(i) s'appelle " + (game.players[game.selectPlayer]!.getTeamName()))
        }
    }

    public static func initializeTeamsCharacters(playerNumber : Int){
        // Il faudra demander à chaque équipe de choisir 3 personnages parmis la liste
        //des types de personnages proposés : 1. Combattant 2. Mage 3. Colosse 4. Nain
        // améliorer les avertissements quand les choix sont erronés.
        game.selectPlayer = game.playersName[playerNumber]
        
        while (game.players[game.selectPlayer]!.getTeamMembersNumber()) < 3 {
            print("")
            print(" Joueur \(playerNumber + 1) : Choisissez le personnage \(game.players[game.selectPlayer]!.getTeamMembersNumber() + 1) de votre équipe parmis les choix suivants : "
                + "\n1. Combattant"
                + "\n2. Mage"
                + "\n3. Colosse"
                + "\n4. Nain")
            print("quel est votre choix?")
            
            if let choixPersonnage = readLine() {
                
                switch choixPersonnage {
                case "1":
                    // optimiser les cases suivants
                    
                    let personnage = Warrior()
                    Character.addNewCharacter(personnage: personnage)
                    
                case "2":
                    
                    let personnage = Wizard()
                    Character.addNewCharacter(personnage: personnage)
                    
                case "3":
                    
                    let personnage = Colossus()
                    Character.addNewCharacter(personnage: personnage)
                    
                case "4":
                    
                    let personnage = Dwarf()
                    Character.addNewCharacter(personnage: personnage)
                    
                default:
                    
                    print("")
                    print("Je n'ai pas compris, veuillez choisir un numéro de 1 à 4 selon le personnage choisi.")
                }
            }
        }
    }
    // faire une func pour afficher la liste des équipes.
}
