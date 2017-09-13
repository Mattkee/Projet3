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
        
        let player = Player()
        // This loop allows to select each player and their characters.
        for i in 0 ... 1 {
            
            initializeTeamsName(playerNumber: i)
            player.initializeTeamsCharacters(playerNumber: i)
        }
    }
    
    // this static method allow to create the players.
    public func initializeTeamsName(playerNumber : Int){
        
        // this let propertie allow to create instance of class player.
        let player = Player()
        
        // this let propertie allow to define name of instance team.
        let playerName = player.playerName(playerNumber : playerNumber)
        
        // add playerName in instance player, and after add team in the array players.
        player.setTeamName(name : playerName)
        player.teamNumber = playerNumber
        players.append(player)
        
        // this loop will allow to display stored players.
        print("")
        for player in players {
            
            print("Le joueur \(player.teamNumber + 1) s'appelle " + (player.getTeamName()))
        }
    }
    
    
    // This method will allow to randomly choose which players attack first and which players defended.
    public func battlePhase(playerOne : Player , playerTwo : Player) {
        
        while game.characterBattle.count != 1 {
            Player.selectCharacter(player: playerOne)
        }
        game.chest(characterSelected: playerOne.getTeamCharacter(characterNumber: characterBattle[0].characterNumber))
        
        Wizard.WizardHeals(playerOne: playerOne, playerTwo: playerTwo, wizardHeals: players[playerOne.getPlayernumber()].getTeamCharacter(characterNumber: characterBattle[0].characterNumber))
        
        if characterBattle.count != 0 {
            
            Spell.castSpell(playerOne: playerOne, playerTwo: playerTwo, characterSelected: characterBattle[0])
        }
        
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
        
        
        let luck = Int(arc4random_uniform(UInt32(2)))
        
        if luck == 1 {
            print("un coffre apparait devant \(characterSelected.name) voulez vous l'ouvrir ?"
                + "\n1. oui"
                + "\n2. non")
            
            let playerChoice = String(readLine()!)
            
            if playerChoice == "1" || playerChoice == "oui" {

                let typeChestContain = Int(arc4random_uniform(UInt32(2)))
                
                if typeChestContain == 1 {
                    Objects.addCharacterObject(characterSelected: characterSelected)
                    
                } else {
                    Spell.addCharacterSpell(characterSelected: characterSelected)
                }
                
            } else {
                print("Votre réponse a fait disparaître le coffre")
                print("")
            }
        }
    }
}
