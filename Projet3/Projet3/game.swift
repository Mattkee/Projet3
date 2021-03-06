import Foundation

// This class allows the conduct of the phases of the game.
class Game {
    
    // This array will store the selected players.
    var players = [Player]()
    var playerAttack = Player()
    var playerDefender = Player()
    
    // This method will allow to initialize the players and their characters.
    func initializeGame() {
        print("Bienvenue dans notre super jeu de combat.")
        print("")
        
        // This loop allows to select each player and their characters.
        for i in 0 ... 1 {
            
            initializeTeamsName(playerNumber: i)
            players[i].initializeTeamsCharacters(players: players)
        }
    }
    
    // this method allow to create the players.
    func initializeTeamsName(playerNumber : Int){
        
        // this let propertie allow to create instance of class player.
        let player = Player()
        
        // this let propertie allow to define name of instance player.
        player.teamName = playerName(playerNumber : playerNumber)
        
        // add player teamNumber in instance player, and after add team in the array players.
        player.teamNumber = playerNumber
        players.append(player)
        
        // this loop will allow to display stored players.
        print("")
        for player in players {
            
            print("Le joueur \(player.teamNumber + 1) s'appelle " + (player.teamName))
        }
        print("")
    }
    
    // this method allow to define player name.
    func playerName(playerNumber : Int) -> String {
        
        let player = Player()
        
        print("Joueur \(playerNumber + 1) Quel est le nom de votre equipe")
        
        player.teamName = Tools.choiceName(players: players)
        
        return player.teamName
    }
    
    // this method allow to display all characters to each players.
    func seeAllTeamCharacter() {
        
        for player in players {
            print("")
            print("pour l'équipe de \(player.teamName) voici la liste des personnages :")
            print("")
            
            var number = 1
            
            for character in player.teamCharacter {
                character.characterNumber = number
                print("\(character.characterNumber). \(character.name) est un \(character.type), il a \(character.health) pt de vie, \(character.calculateDamage())pt d'attack total, \(character.calculateDefense())pt de défense total et \(character.magic) pt de magie.")
                number += 1
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
    
    // This method will allow to randomly choose which players attack first and which players defended.
    func battlePhase(playerOne : Player , playerTwo : Player) {
        var characterOne : Any = ""
        var characterTwo : Any = ""
        
        repeat {
            
            characterOne = Tools.select(wantSelect: playerOne)
            
        } while characterOne is Bool
        
        if let characterOneSelected = characterOne as? Character {
            print("le personnage selectionné est \(characterOneSelected.name)")
            chest(characterSelected: characterOneSelected)
            
            if characterOneSelected is Wizard && characterOneSelected.magic >= 20 {
                
                if let wizard = characterOneSelected as? Wizard {
                    
                    characterTwo = true
                    wizard.heals(playerOne: playerOne, playerTwo: playerTwo, characterOneSelected: wizard)
                    remove()
                    
                }
            }
            
            if characterOneSelected.spells.count > 0 && characterTwo is String {
                
                characterOneSelected.castSpell(playerTwo: playerTwo)
                
            } else if characterTwo is String {
                
                repeat {
                
                    characterTwo = Tools.select(wantSelect: playerTwo)
                
                } while characterTwo is Bool
                
            }
            
            if let characterTwoSelected = characterTwo as? Character {
                characterOneSelected.attackPhase(characterTwo: characterTwoSelected)
            }
        }

        
        remove()
        
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
                
                if players.count == 1 {
                   print("\(players[0].teamName) vous gagnez le jeu.")
                   print("")
                }
                
            } else {
                    
                print("\(players[0].teamName) vous gagnez le jeu.")
                print("")
            }
            
        } while players.count > 1
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
                    characterSelected.addCharacterObject()
                    
                } else {
                    characterSelected.addCharacterSpell()
                }
                
            } else {
                print("Votre réponse a fait disparaître le coffre")
                print("")
            }
        }
    }
    
    // this method will allow to remove a character or player when this character's health is less than 1 or player team character is 0.
    func remove() {
        
        for player in players {
            var characterNumber = 0
            for character in player.teamCharacter {
                
                if character.health < 1 {
                    print("")
                    print("\(character.name) est mort, il est retiré du jeu.")
                    print("")
                    player.teamCharacter.remove(at: characterNumber)
                }
                characterNumber += 1
            }
        }
        
        for player in players {
            let numberCharacter = player.teamCharacter.count
            if numberCharacter == 0 {
                players.remove(at: player.teamNumber)
                print("le joueur \(player.teamName) a perdu la partie")
                
            }
        }
    }
    
}
