import Foundation

//The game class will allow us to manage the different stages of the game

class Game {
    var players = [String : Player]()
    var playersName = [String]()
    var characterBattle = [Character]()
    var selectPlayer : String = ""
    var playerAttack : String = ""
    var playerDefender : String = ""
    var objectsAttackList = [EpeeLarge(), Hache()]
    var objectsMagicList = [MagicBaguette()]
    //First stage of the game we'll ask the players to choose the name of their team and choose three characters
    
    public func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        print("")
        for i in 0 ... 1 {
            
            Player.initializeTeamsName(playerNumber: i)
            Player.initializeTeamsCharacters(playerNumber: i)
        }
    }
    public func beginGame() {
        
        print("")
        print("Que le jeu commence !!!")
        
        Player.seeAllTeamCharacter()
        // créer les fonction pour commencer le jeu.
        
        let playerBeginAttack = Int(arc4random_uniform(UInt32(game.players.count)))
        playerAttack = playersName[playerBeginAttack]
        
        if playerBeginAttack == 1 {
            playerDefender = playersName[playerBeginAttack - 1]
        } else {
            playerDefender = playersName[playerBeginAttack + 1]
        }
        
        print("")
        print("\(playerAttack) vous débutez le combat")
        
    }
    
        // faire la même chose avec la class player, rajouter un numéro à chaque joueur pour simplifier le jeu.
    public func battle() {
        repeat{
            Player.battleCharacter(playerOne: playerAttack, playerTwo: playerDefender)
            Player.seeAllTeamCharacter()
            
            if players.count == 2 {
                Player.battleCharacter(playerOne: playerDefender, playerTwo: playerAttack)
            }
        
            Player.seeAllTeamCharacter()
            // finir la deuxième boucle d'action voir essayer d'inclure tout de suite l'étape 3.
        } while players.count > 1
        
        for (name , _) in players {
           print("\(name) vous gagnez le jeu.")
        }
    }
    // créer une fonction coffre qui de manière aléatoire donnera une arme ou autre chose au personnage selectionné.
    func chest(characterSelected : Character) {
        let luck = Int(arc4random_uniform(UInt32(2)))
        
        if luck == 1 {
           print("un coffre apparait devant \(characterSelected.name) voulez vous l'ouvrir ?"
            + "\n1. oui"
            + "\n2. non")
            
            let playerChoice = String(readLine()!)
            
            if playerChoice == "1" || playerChoice == "oui" {
                
                if Character.findCharacter(type: characterSelected) == "mage" {
                    let openChestNumber = Int(arc4random_uniform(UInt32(game.objectsMagicList.count)))
                    
                    characterSelected.objects = [Objects]()
                    
                    characterSelected.objects.append(objectsMagicList[openChestNumber])
                    
                    print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(characterSelected.objects[0].objectProfit)")
                    print("")
                } else {
                    let openChestNumber = Int(arc4random_uniform(UInt32(game.objectsAttackList.count)))
                    
                    characterSelected.objects = [Objects]()
                    
                    characterSelected.objects.append(objectsAttackList[openChestNumber])
                    
                    print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(characterSelected.objects[0].objectProfit)")
                    print("")
                }
            } else {
                print("Votre réponse a fait disparaître le coffre")
                print("")
            }
        }
    }
}
