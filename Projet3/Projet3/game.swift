import Foundation

// This class allows the conduct of the phases of the game.
class Game {
    
    // This array will store the selected players.
    var players = [Player]()
    var playerAttack = Player()
    var playerDefender = Player()
    var characterBattle = [Character]()
    
    // This method will allow to initialize the players and their characters.
    func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        print("")
        
        // This loop allows to select each player and their characters.
        for i in 0 ... 1 {
            
            initializeTeamsName(playerNumber: i)
            players[i].initializeTeamsCharacters()
        }
    }
    
    // this static method allow to create the players.
    func initializeTeamsName(playerNumber : Int){
        
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
            
            print("Le joueur \(player.teamNumber + 1) s'appelle " + (player.teamName))
        }
    }
    
    // this method allow to check if a name is already exist in player or player's characters.
    public func checkName(nameChoice : String) -> Bool{
        
        // this loop will observe players name.
        for player in players {
            
            if nameChoice.lowercased() == player.teamName.lowercased() {
                return true
            } else {
                
                // this loop will observe all characters name.
                for character in player.teamCharacter {
                    if nameChoice.lowercased() == character.name.lowercased() {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    // this method allow to display all characters to each players.
    func seeAllTeamCharacter() {
        
        for player in players {
            print("")
            print("pour l'équipe de \(player.teamName) voici la liste des personnages :")
            print("")
            for character in player.teamCharacter {
                print("\(character.characterNumber + 1). le personnage \(character.name) qui est un \(character.findTypeCharacter()) et il a \(character.health) pt de vie et a \(character.calculateDamage())pt d'attack total et \(character.magic) pt de magie.")
            }
        }
    }
    
    // This method will allow to randomly choose which players attack first and which players defended.
    func playerChoiceBattle() {
        
        // this line will randomly choose which players attack first.
        let playerNumber = Int(arc4random_uniform(UInt32(players.count)))
        playerAttack = players[playerNumber]
        
        if playerNumber == 1 {
            playerDefender = players[playerNumber - 1]
        } else {
            playerDefender = players[playerNumber + 1]
        }
        
        print("")
        print("\(playerAttack.teamName) vous débutez le combat")
    }
    
    // This method will allow to carry out the phase of attack between two character.
    func attackPhase(characterOne : Character, characterTwo : Character) {
        
        characterTwo.health -= characterOne.calculateDamage()
        
        if characterOne.magicMax != 0 {
            characterOne.magic += 20
            
            if characterOne.magic > characterOne.magicMax {
                characterOne.magic = characterOne.magicMax
            }
        }
        
        print("\(characterOne.name) attaque \(characterTwo.name) et lui inflige \(characterOne.calculateDamage()) point de dégat.")
    }
    
    // This method will allow to randomly choose which players attack first and which players defended.
    func battlePhase(playerOne : Player , playerTwo : Player) {
        var characterOne : Any = ""
        var characterTwo : Any = ""
        
        repeat {
            
            characterOne = playerOne.selectCharacter()
            
        } while characterOne is Bool
        
        if let characterOneSelected = characterOne as? Character {
            print("le personnage selectionné est \(characterOneSelected.name)")
            chest(characterSelected: characterOneSelected)
            
            if characterOneSelected is Wizard {
                
                if let wizard = characterOneSelected as? Wizard {
                    wizard.WizardHeals(playerOne: playerOne, playerTwo: playerTwo, characterOneSelected: wizard)
                }
            }
            Spell.castSpell(playerOne: playerOne, playerTwo: playerTwo, characterSelected: characterOneSelected)
            
            if characterTwo is String {
                
                repeat {
                
                    characterTwo = playerTwo.selectCharacter()
                
                } while characterTwo is Bool
                
            }
            
            if let characterTwoSelected = characterTwo as? Character {
                attackPhase(characterOne: characterOneSelected, characterTwo: characterTwoSelected)
            }
        }

        
        Player.removeCharacter()
        removePlayer()
        
        if players.count > 1 {
            seeAllTeamCharacter()
        }
        
    }
    
    // This method will allow to run the phases of combat to the game.
    func battle() {
        
        print("")
        print("Que le jeu commence !!!")
        
        // begin to display all players's characters.
        seeAllTeamCharacter()
        
        repeat{
           
            playerChoiceBattle()
            battlePhase(playerOne: playerAttack, playerTwo: playerDefender)
            print("")
            if players.count != 1 {
                
            print("c'est au tour de \(playerDefender.teamName) de jouer")
            battlePhase(playerOne: playerDefender, playerTwo: playerAttack)
                
            } else {
                    
                print("\(players[0].teamName) vous gagnez le jeu.")
                
            }
            
        } while players.count > 1
        
        for player in players {
            
            print("\(player.teamName) vous gagnez le jeu.")
            
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
                    characterSelected.addCharacterObject(characterSelected: characterSelected)
                    
                } else {
                    characterSelected.addCharacterSpell(characterSelected: characterSelected)
                }
                
            } else {
                print("Votre réponse a fait disparaître le coffre")
                print("")
            }
        }
    }
    
    // this method will allow to remove a player when this player's number of character is 0
    public func removePlayer() {
        for player in players {
            let numberCharacter = player.teamCharacter.count
            if numberCharacter == 0 {
                players.remove(at: player.teamNumber)
                print(" le joueur \(player.teamName) a perdu la partie")
            }
        }
    }
}
