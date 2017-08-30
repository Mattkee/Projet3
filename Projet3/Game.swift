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
        var characterBattle = [Character]()
        
        repeat {
            Character.viewCharacterBattle(player: playerAttack)
            let choiceCharacter = readLine()
            // optimiser la boucle for
            for (_, type) in (players[playerAttack]?.getTeamCharacter())! {
            if choiceCharacter == "1" || choiceCharacter == "2" || choiceCharacter == "3 " {
                if type.characterNumber == 1 || type.characterNumber == 2 || type.characterNumber == 3 {
                    characterBattle.append(type)
                }
            } else if choiceCharacter == type.name {
                characterBattle.append(type)
                }
            }
        } while characterBattle.count == 1
        
        repeat {
            Character.viewCharacterBattle(player: playerDefender)
            let choiceCharacter = readLine()
            
            for (_, type) in (players[playerAttack]?.getTeamCharacter())! {
                if choiceCharacter == "1" || choiceCharacter == "2" || choiceCharacter == "3 " {
                    if type.characterNumber == 1 || type.characterNumber == 2 || type.characterNumber == 3 {
                        characterBattle.append(type)
                    }
                } else if choiceCharacter == type.name {
                    characterBattle.append(type)
                }
            }
        } while characterBattle.count == 2
        
        characterBattle[1].health -= characterBattle[0].attack
        
        Player.remoteCharacter()
        // finir la deuxième boucle d'action voir essayer d'inclure tout de suite l'étape 3.
    }
}
