import Foundation

//The game class will allow us to manage the different stages of the game

class Game {
    var players = [String : Player]()
    var playersName = [String]()
    var selectPlayer : String = ""
    var playerAttack : String = ""
    var playerDefender : String = ""
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
        print("")
        Player.seeAllTeamCharacter()
        // créer les fonction pour commencer le jeu.
        
        let playerBeginAttack = Int(arc4random_uniform(UInt32(game.players.count)))
        playerAttack = playersName[playerBeginAttack]
        
        if playerBeginAttack == 1 {
            playerDefender = playersName[playerBeginAttack - 1]
        } else {
            playerDefender = playersName[playerBeginAttack + 1]
        }
        
        print("\(playerAttack) vous débutez le combat")
        
    }
        // changer la boucle pour simplifier les phases de jeu en rajoutant une propriété characterNumber pour définir un numéro à chaque personnage afin de simplifier les choix.
        // faire la même chose avec la class player, rajouter un numéro à chaque joueur pour simplifier le jeu.
    public func battle() {
        var playerOne : Character
        var playerTwo : Character
        
        repeat {
        playerOne = Character.selectCharacter(player : playerAttack)!
        } while playerOne.characterNumber > 0 && playerOne.characterNumber < 4
        
        repeat {
        playerTwo = Character.selectCharacter(player : playerDefender)!
        } while playerTwo.characterNumber > 0 && playerTwo.characterNumber < 4
        
        playerTwo.health -= (playerOne.attack)
        Player.remoteCharacter()
    }
}
