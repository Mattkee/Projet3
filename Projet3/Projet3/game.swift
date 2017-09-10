import Foundation

// This class allows the conduct of the phases of the game.
class Game {
    
    // This array will store the selected players.
    var players = [Player]()
    var playerAttack = Player()
    var playerDefender = Player()
    var characterBattle = [Character]()
    
    // This method will allow to initialize the players and their characters.
    public func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        print("")
        
        // This loop allows to select each player and their characters.
        for i in 0 ... 1 {
            
            Player.initializeTeamsName(playerNumber: i)
            Player.initializeTeamsCharacters(playerNumber: i)
        }
    }
    
    // This method will allow to randomly choose which players attack first and which players defended.
    public func battlePhase(playerOne : Player , playerTwo : Player) {
        
        while game.characterBattle.count != 1 {
            Player.selectCharacter(player: playerOne)
        }
        game.chest(characterSelected: playerOne.getTeamCharacter(characterNumber: characterBattle[0].characterNumber))
        
        Wizard.WizardHeals(playerAttack: playerOne, playerDefender: playerTwo, wizardHeals: players[playerOne.getPlayernumber()].getTeamCharacter(characterNumber: characterBattle[0].characterNumber))
        
        if characterBattle.count != 0 {
            while game.characterBattle.count != 2 {
            Player.selectCharacter(player: playerTwo)
            }
            Player.attackPhase(playerOne: playerOne, playerTwo: playerTwo)
            characterBattle = [Character]()
        }
        
        Player.seeAllTeamCharacter()
        
        Player.remoteCharacter()
        Player.remotePlayer()
        
    }
    
    // This method will allow to run the phases of combat to the game.
    public func battle() {
        
        print("")
        print("Que le jeu commence !!!")
        
        // begin to display all players's characters.
        Player.seeAllTeamCharacter()
        
        repeat{
            
            Player.playerChoiceBattle()
            battlePhase(playerOne: playerAttack, playerTwo: playerDefender)
            print("")
            print("c'est au tour de \(playerDefender.getTeamName()) de jouer")
            battlePhase(playerOne: playerDefender, playerTwo: playerAttack)
            
        } while players.count > 1
        
        for player in players {
            
            print("\(player.getTeamName()) vous gagnez le jeu.")
            
        }
    }
    
    // This method will allow random to a chest to appear in front of the first character to be selected for the combat phase.
    // each chest contains an object chosen at random, that will be added to the character.
    func chest(characterSelected : Character) {
        
        // this propertie contains lot of objet for the random choice of the chest.
        let listObjects = [
            AttackObject(name: "épée simple", attackDamage: 10),
            AttackObject(name: "hache simple", attackDamage: 50),
            AttackObject(name: "épée lourde", attackDamage: 20),
            MagicObject(name: "baguette", magicPoint: 30)
        ]
        
        let luck = Int(arc4random_uniform(UInt32(2)))
        
        if luck == 1 {
            print("un coffre apparait devant \(characterSelected.name) voulez vous l'ouvrir ?"
                + "\n1. oui"
                + "\n2. non")
            
            let playerChoice = String(readLine()!)
            
            if playerChoice == "1" || playerChoice == "oui" {

                let openChestNumber = Int(arc4random_uniform(UInt32(listObjects.count)))
                    
                characterSelected.objects.removeAll()
                    
                characterSelected.objects.append(listObjects[openChestNumber])
                    
                for object in characterSelected.objects {
                    if let attackObject = object as? AttackObject {
                        print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(attackObject.attackDamage)")
                        print("")
                    } else if let magicObject = object as? MagicObject {
                        print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(magicObject.magicPoint)")
                        print("")
                    }
                }
            } else {
                print("Votre réponse a fait disparaître le coffre")
                print("")
            }
        }
    }
}