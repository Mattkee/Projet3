//The game class will allow us to manage the different stages of the game
class Game {
    var players = [Player]()
    var playerNumber = 0
    //First stage of the game we'll ask the players to choose the name of their team and choose three characters
    
    public func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        for i in 0 ... 1 {
            playerNumber += 1
            self.initializeTeamsName(playerNumber: i)
            self.initializeTeamsCharacters(playerNumber: i)
        }
    }
    private func initializeTeamsName(playerNumber : Int){
        
        
        let team = Player()
        
        print("Joueur \(playerNumber + 1) Quel est le nom de votre equipe")

        let teamName = team.playerName()
        
        team.setTeamName(name : teamName)
        players.append(team)
        
 // changer la boucle pour qu'elle soit plus compréhensible, en démarrant de 1 et en changer l'appelation i.
        
        for i in 0 ... (players.count - 1){
            print("joueur \(i + 1) s'appelle " + players[i].getTeamName())
        }
    }
    private func initializeTeamsCharacters(playerNumber : Int){
        // Il faudra demander à chaque équipe de choisir 3 personnages parmis la liste
        //des types de personnages proposés : 1. Combattant 2. Mage 3. Colosse 4. Nain
        let character = Character(health : 0 , attack : 0)
        
        while players[playerNumber].getTeamMembersNumber() < 3 {
            print(" Joueur \(playerNumber + 1) : Choisissez le personnage \(players[playerNumber].getTeamMembersNumber() + 1) de votre équipe parmis les choix suivants : 1. Combattant 2. Mage 3. Colosse 4. Nain")

            if let choixPersonnage = Int(readLine()!) {
            
                switch choixPersonnage {
                case 1:
                    // remplacer par une methode nameCharacter.

                    let name = character.nameCharacter()
                
                    let personnage = Warrior()

                
                    players[playerNumber].setTeamMember(name : name , member: personnage)
                
                    print("Votre personnage \(players[playerNumber].getTeamMembersNumber()) est un combattant du nom de \(name)")
                    print(" le nombre de personnage est \(players[playerNumber].getTeamMembersNumber())")
                
                case 2:
                
                    let name = character.nameCharacter()
                
                    let personnage = Wizard()
                
                    players[playerNumber].setTeamMember(name : name , member: personnage)
                
                    print("Votre personnage \(players[playerNumber].getTeamMembersNumber()) est un Mage du nom de \(name)")
                    print(" le nombre de personnage est \(players[playerNumber].getTeamMembersNumber())")
                
                case 3:
                
                    let name = character.nameCharacter()
                
                    let personnage = Colossus()
                
                    players[playerNumber].setTeamMember(name : name , member: personnage)
                
                    print("Votre personnage \(players[playerNumber].getTeamMembersNumber()) est un Colosse du nom de \(name)")
                    print(" le nombre de personnage est \(players[playerNumber].getTeamMembersNumber())")
                
                case 4:
                
                    let name = character.nameCharacter()
                
                    let personnage = Dwarf()
                
                    players[playerNumber].setTeamMember(name : name , member: personnage)
                
                    print("Votre personnage \(players[playerNumber].getTeamMembersNumber()) est un Nain du nom de \(name)")
                    print(" le nombre de personnage est \(players[playerNumber].getTeamMembersNumber())")
                default:
                    print("Je n'ai pas compris")
                }
            }
        }
    }
}
