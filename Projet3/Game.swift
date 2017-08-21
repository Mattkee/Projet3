//The game class will allow us to manage the different stages of the game
class Game {
    var players = [String : Player]()
    var playersName = [String]()
    var selectPlayer : String = ""
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
        print("Que le jeu commence !!!")
        print("")
        Player.seeAllTeamCharacter()
       // créer les fonction pour commencer le jeu.
    }
}
