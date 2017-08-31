import Foundation

//The game class will allow us to manage the different stages of the game

class Game {
    var players = [String : Player]()
    var playersName = [String]()
    var characterBattle = [Character]()
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
        
        print("")
        print("\(playerAttack) vous débutez le combat")
        
    }
        // changer la boucle pour simplifier les phases de jeu en rajoutant une propriété characterNumber pour définir un numéro à chaque personnage afin de simplifier les choix.
        // faire la même chose avec la class player, rajouter un numéro à chaque joueur pour simplifier le jeu.
    public func battle() {
        
        while characterBattle.count != 1 {
            Character.viewCharacterBattle(player: playerAttack)
            Character.selectCharacter(player: playerAttack)
            }
        
        while characterBattle.count != 2 {
            Character.viewCharacterBattle(player: playerDefender)
            Character.selectCharacter(player: playerDefender)
            }
        
        while characterBattle.count != 2 {
        self.characterBattle[1].health -= self.characterBattle[0].attack
        Player.battleCharacter(playerSelected : playerDefender , choiceCharacter : (self.characterBattle[1]))
            }
        
        characterBattle = [Character]()
        
        while characterBattle.count != 1 {
            Character.viewCharacterBattle(player: playerDefender)
            Character.selectCharacter(player: playerDefender)
            }
        
        while characterBattle.count != 2 {
            Character.viewCharacterBattle(player: playerAttack)
            Character.selectCharacter(player: playerAttack)
            }
        
        while characterBattle.count != 2 {
        self.characterBattle[1].health -= self.characterBattle[0].attack
        Player.battleCharacter(playerSelected : playerDefender , choiceCharacter : (self.characterBattle[1]))
            }
        
        Player.remoteCharacter()
        Player.remotePlayer()
        Player.seeAllTeamCharacter()
        // finir la deuxième boucle d'action voir essayer d'inclure tout de suite l'étape 3.
    }
}
