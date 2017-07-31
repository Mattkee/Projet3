//The game class will allow us to manage the different stages of the game
class Game {
    var players = [Player]()
    
    //First stage of the game we'll ask the players to choose the name of their team and choose three characters
    
    public func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        for i in 0 ... 1 {
            self.initializeTeamsName(playerNumber: i)
        }
    }
    private func initializeTeamsName(playerNumber : Int){
        
        
        let player = Player()
        
        print("Joueur \(playerNumber + 1) Quel est le nom de votre equipe")
        
        var name : String? = "Player"
        
        repeat{
            name = readLine()
        } while((name?.characters.count)! <= 3)
        
        player.setTeamName(name : name!)
        players.append(player)
        
        
        for i in 0 ... (players.count - 1){
            print(players[i].getTeamName())
        }
    }
    private func initializeTeamsCharacters(playerNumber : Int){
        // Il faudra demander à chaque équipe de choisir 3 personnages parmis la liste
        //des types de personnages proposés : 1. Combattant 2. Mage 3. Colosse 4. Nain
        
        let player = Player()
        
        while players[playerNumber].getTeamMembersNumber() < 3  {
            print(" Joueur \(playerNumber) : Choisissez le personnage \(players[playerNumber].getTeamMembersNumber() + 1 ) de votre équipe parmis les choix suivants : 1. Combattant 2. Mage 3. Colosse 4. Nain")
            var choixPersonnage : Int? = 0
            choixPersonnage = Int(readLine()!)
            switch choixPersonnage! {
            case 1:
                var name : String? = "Character"
                
                repeat{
                    name = String(readLine()!)
                } while((name?.characters.count)! <= 3)
                
                player.setTeamMember(name : name!, member: Warrior)
                players.append(player)
                
            case 2:
                var name : String? = "Character"
                repeat{
                    name = readLine()
                }while((name?.characters.count)! <= 3)
                
                player.setTeamMember(name : name!)
                players.append(player)
                
                let personnage = Wizard()
                players[playerNumber].setTeamMember(member: personnage)
            case 3:
                var name : String? = "Character"
                repeat{
                    name = readLine()
                }while((name?.characters.count)! <= 3)
                
                player.setTeamMember(name : name!)
                players.append(player)
                
                let personnage = Colossus()
                players[playerNumber].setTeamMember(member: personnage)
            case 4:
                var name : String? = "Character"
                repeat{
                    name = readLine()
                }while((name?.characters.count)! <= 3)
                
                player.setTeamMember(name : name!)
                players.append(player)
                
                let personnage = Dwarf()
                players[playerNumber].setTeamMember(member: personnage)
                
            default:
                print("Je n'ai pas compris")
            }
            
            
        }
    }
}
