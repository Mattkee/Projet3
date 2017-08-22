import Foundation

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
        print("")
        print("Que le jeu commence !!!")
        print("")
        Player.seeAllTeamCharacter()
        // créer les fonction pour commencer le jeu.
        
        let playerBeginAttack = Int(arc4random_uniform(1))
        selectPlayer = playersName[playerBeginAttack]
        var numberCharacter : Int = 0
        print("\(selectPlayer) vous débutez le combat")
        print("lequel parmi vos personnage voulez vous choisir pour ce combat :")
        print("")
        
        // changer la boucle pour simplifier les phases de jeu en rajoutant une propriété characterNumber pour définir un numéro à chaque personnage afin de simplifier les choix.
        // faire la même chose avec la class player, rajouter un numéro à chaque joueur pour simplifier le jeu.
        for (name, type) in (players[selectPlayer]?.getTeamCharacter())! {
            numberCharacter += 1
            if type is Warrior {
                let characterType = "combattant"
                print("\(numberCharacter). le personnage \(name) qui est un \(characterType)")
            } else if type is Wizard {
                let characterType = "mage"
                print("\(numberCharacter). le personnage \(name) qui est un \(characterType)")
            } else if type is Colossus {
                let characterType = "colosse"
                print("\(numberCharacter). le personnage \(name) qui est un \(characterType)")
            } else {
                let characterType = "nain"
                print("\(numberCharacter). le personnage \(name) qui est un \(characterType)")
            }
        }
        numberCharacter = 0
        
    }
}
