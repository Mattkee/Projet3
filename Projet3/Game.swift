//The game class will allow us to manage the different stages of the game
class Game {
    var players = [Player]()
    
    //First stage of the game we'll ask the players to choose the name of their team and choose three characters
    
    public func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        for i in 0 ... 1 {
            self.initializeTeamsName(playerNumber: i)
            self.initializeTeamsCharacters(playerNumber: i)
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
        let mavar = players[playerNumber].getTeamMembersNumber()
        print(mavar)
        
        self.players = [Player]()
        let player = Player()
        
        var name : String? = "Character"
        
        while players[playerNumber].getTeamMembersNumber() < 2  {
            print(" Joueur \(playerNumber + 1) : Choisissez le personnage \(players[playerNumber].getTeamMembersNumber()) de votre équipe parmis les choix suivants : 1. Combattant 2. Mage 3. Colosse 4. Nain")
            var choixPersonnage : Int? = 0
            choixPersonnage = Int(readLine()!)
            switch choixPersonnage! {
            case 1:
                
                repeat{
                    name = String(readLine()!)
                } while((name?.characters.count)! <= 3)
                
                let personnage = Warrior(name: name!)
                
                print("le nom de ce combattant est \(name!)")
                
                player.setTeamMember(member: personnage)
                players.append(player)
                
            case 2:
                
                repeat{
                    name = String(readLine()!)
                } while((name?.characters.count)! <= 3)
                
                print("le nom de ce Mage est \(name!)")
                
                let personnage = Wizard(name: name!)
                player.setTeamMember(member: personnage)
                players.append(player)
                
            case 3:
                
                repeat{
                    name = String(readLine()!)
                }while((name?.characters.count)! <= 3)
                
                print("le nom de ce colosse est \(name!)")
                
                let personnage = Colossus(name: name!)
                player.setTeamMember(member: personnage)
                players.append(player)
            case 4:
                
                repeat{
                    name = String(readLine()!)
                }while((name?.characters.count)! <= 3)
                
                let personnage = Dwarf(name: name!)
                
                print("le nom de ce nain est \(name!)")
                
                player.setTeamMember(member: personnage)
                players.append(player)
                
            default:
                print("Je n'ai pas compris")
            }
            
            
        }
    }
}
