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
        
        let playerBeginAttack = Int(arc4random_uniform(UInt32(game.players.count)))
        selectPlayer = playersName[playerBeginAttack]
        
        print("\(selectPlayer) vous débutez le combat")
        print("lequel parmi vos personnage voulez vous choisir pour ce combat :")
        print("")
    }
        // changer la boucle pour simplifier les phases de jeu en rajoutant une propriété characterNumber pour définir un numéro à chaque personnage afin de simplifier les choix.
        // faire la même chose avec la class player, rajouter un numéro à chaque joueur pour simplifier le jeu.
    public func selectCharacterForBattle() -> Character? {
        var characterAttack : Character
        
        for (name, type) in (players[selectPlayer]?.getTeamCharacter())! {
            
            print("\(type.characterNumber). le personnage \(name) qui est un \(Character.findCharacter(type: type))")
        }
        if let choixPersonnage = readLine() {
            
            switch choixPersonnage {
            case "1":
                
                for (_, type) in (players[selectPlayer]?.getTeamCharacter())! {
                    if type.characterNumber == 1 {
                        characterAttack = type
                        return characterAttack
                    }
                }
            case "2":
                
                for (_, type) in (players[selectPlayer]?.getTeamCharacter())! {
                    if type.characterNumber == 2 {
                        characterAttack = type
                        return characterAttack
                    }
                }
            case "3":
                
                for (_, type) in (players[selectPlayer]?.getTeamCharacter())! {
                    if type.characterNumber == 3 {
                        characterAttack = type
                        return characterAttack
                    }
                }
            default:
                
                print("")
                print("Je n'ai pas compris, veuillez choisir un numéro de 1 à 3 selon le personnage choisi.")
            }
        }
        return nil
    }
}

