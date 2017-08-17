//The game class will allow us to manage the different stages of the game
class Game {
    var players = [String : Player]()
    
    //First stage of the game we'll ask the players to choose the name of their team and choose three characters
    
    public func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        print("")
        for i in 0 ... 1 {
            
            self.initializeTeamsName(playerNumber: i)
            self.initializeTeamsCharacters(playerNumber: i)
        }
    }
    private func initializeTeamsName(playerNumber : Int){
        
        
        let team = Player()
        
        print("Joueur \(playerNumber + 1) Quel est le nom de votre equipe")

        let teamName = team.playerName()
        
        team.setTeamName(name : teamName)
        players[teamName] = team
        
 // changer la boucle pour qu'elle soit plus compréhensible, en démarrant de 1 et en changer l'appelation i.
        print("")
        for i in 0 ... (players.count - 1){
            print("Le joueur \(i + 1) s'appelle " + players[i].getTeamName())
        }
    }
    private func initializeTeamsCharacters(playerNumber : Int){
        // Il faudra demander à chaque équipe de choisir 3 personnages parmis la liste
        //des types de personnages proposés : 1. Combattant 2. Mage 3. Colosse 4. Nain
        // améliorer les avertissements quand les choix sont erronés.
                
        while players[playerNumber].getTeamMembersNumber() < 3 {
            print("")
            print(" Joueur \(playerNumber + 1) : Choisissez le personnage \(players[playerNumber].getTeamMembersNumber() + 1) de votre équipe parmis les choix suivants : "
                + "\n1. Combattant"
                + "\n2. Mage"
                + "\n3. Colosse"
                + "\n4. Nain")
            print("quel est votre choix?")

            if let choixPersonnage = readLine() {
                
                switch choixPersonnage {
                case "1":
                    // remplacer par une methode nameCharacter.
                
                    let personnage = Warrior()
                    personnage.nameCharacter()
                    // Trouver un moyen de vérifier si le nom n'est pas déjà utilisé.
                
                    players[playerNumber].setTeamMember(name : personnage.name , member: personnage)
                
                    print("")
                    print("\(players[playerNumber].getTeamName()) a \(players[playerNumber].getTeamMembersNumber()) personnage.")
                    
                    players[playerNumber].seeTeamMembers()
                
                case "2":
                
                    let personnage = Wizard()
                    personnage.nameCharacter()
                    // Trouver un moyen de vérifier si le nom n'est pas déjà utilisé.
                    
                    players[playerNumber].setTeamMember(name : personnage.name , member: personnage)
                
                    print("")
                    print("\(players[playerNumber].getTeamName()) a \(players[playerNumber].getTeamMembersNumber()) personnage.")
                    
                    players[playerNumber].seeTeamMembers()
                
                case "3":
                
                    let personnage = Colossus()
                    personnage.nameCharacter()
                    // Trouver un moyen de vérifier si le nom n'est pas déjà utilisé.
                    
                    players[playerNumber].setTeamMember(name : personnage.name , member: personnage)
                
                    print("")
                    print("\(players[playerNumber].getTeamName()) a \(players[playerNumber].getTeamMembersNumber()) personnage.")
                    
                    players[playerNumber].seeTeamMembers()
                
                case "4":
                
                    let personnage = Dwarf()
                    personnage.nameCharacter()
                    // Trouver un moyen de vérifier si le nom n'est pas déjà utilisé.
                    
                    players[playerNumber].setTeamMember(name : personnage.name , member: personnage)
                
                    print("")
                    print("\(players[playerNumber].getTeamName()) a \(players[playerNumber].getTeamMembersNumber()) personnage.")
                    
                    players[playerNumber].seeTeamMembers()
                    
                default:
                    
                    print("")
                    print("Je n'ai pas compris, veuillez choisir un numéro de 1 à 4 selon le personnage choisi.")
                }
            }
        }
    }
}
