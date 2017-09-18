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
            players[i].initializeTeamsCharacters()
        }
    }
    
    // this static method allow to create the players.
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
    
    // this method allow to define player name.
    public func playerName(playerNumber : Int) -> String {
        
        let player = Player()
        
        print("")
        print("Joueur \(playerNumber + 1) Quel est le nom de votre equipe")
        
        // these two repeat loops will allow to choice name for team, these loops running while define name is already exist or if define name is less than 3 characters. if condition are true this method return teamName.
        repeat{
            repeat { print("veuillez donner un nom correct de minimum 4 caractères.")
                if let setName = readLine(){
                    player.teamName = String(setName)
                }
            } while (checkName(nameChoice: player.teamName) == true)
        } while((player.teamName.characters.count) <= 3)
        
        return player.teamName
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
                    WizardHeals(playerOne: playerOne, playerTwo: playerTwo, characterOneSelected: wizard)
                }
            }
            castSpell(playerOne: playerOne, playerTwo: playerTwo, characterSelected: characterOneSelected)
            
            if characterTwo is String {
                
                repeat {
                
                    characterTwo = playerTwo.selectCharacter()
                
                } while characterTwo is Bool
                
            }
            
            if let characterTwoSelected = characterTwo as? Character {
                attackPhase(characterOne: characterOneSelected, characterTwo: characterTwoSelected)
            }
        }

        
        removeCharacter()
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
                if players.count == 1 {
                   print("\(players[0].teamName) vous gagnez le jeu.")
                }
            } else {
                    
                print("\(players[0].teamName) vous gagnez le jeu.")
                
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
    func removePlayer() {
        for player in players {
            let numberCharacter = player.teamCharacter.count
            if numberCharacter == 0 {
                players.remove(at: player.teamNumber)
                print(" le joueur \(player.teamName) a perdu la partie")
            }
        }
    }
 
    // this method will allow to remove a character when this character's health is less than 1
    func removeCharacter() {
        for player in players {
            var characterNumber = 0
            for character in player.teamCharacter {
                
                if character.health < 1 {
                    player.teamCharacter.remove(at: characterNumber)
                }
                characterNumber += 1
            }
        }
    }
    
    // This method puts in place the use of a magic spell selected phase.
    func castSpell (playerOne: Player, playerTwo : Player, characterSelected : Character) {
        
        characterSelected.characterMinNeedMagic(characterSelected: characterSelected)
        var characterTwo : Any = ""
        
        if characterSelected.spell.count != 0 || characterSelected.magicMinNeed == true {
            while characterTwo is String {
                print("voulez vous attaquer ou lancer un sort ?"
                    + "\n1. attaquer"
                    + "\n2. lancer un sort")
                print("Ecrivez le numéro de l'action ou le nom de l'action")
                
                if let choiceAction = readLine() {
                    
                    if choiceAction == "2" || choiceAction == "lancer un sort" {
                        
                        repeat {
                            
                            while characterSelected.spellSelected.count == 0 {
                                characterSelected.selectSpell()
                            }
                            characterTwo = playerTwo.selectCharacter()
                            
                        } while characterTwo is Bool
                        
                        if let characterTwoSelected = characterTwo as? Character {
                            characterTwoSelected.health -= characterSelected.spellSelected[0].attack
                            characterSelected.magic -= characterSelected.spellSelected[0].magicPointCost
                            
                            print("\(characterSelected.name) lance un sort à \(characterTwoSelected.name) et lui inflige \(characterSelected.spellSelected[0].attack) de dommage.")
                            
                            characterSelected.spellSelected.removeAll()
                        }
                        
                    } else if choiceAction == "1" || choiceAction == "attaquer" {
                        
                        while characterTwo is String {
                            repeat {
                                
                                characterTwo = playerTwo.selectCharacter()
                                
                            } while characterTwo is Bool
                            
                            if let characterTwoSelected = characterTwo as? Character {
                                attackPhase(characterOne: characterSelected, characterTwo: characterTwoSelected)
                            }
                        }
                        removeCharacter()
                        removePlayer()
                    }
                }
            }
            characterSelected.magicMinNeed = false
        }
    }
    
    // This method will allow the character of type wizard to heal or attack.
    func WizardHeals (playerOne : Player , playerTwo : Player , characterOneSelected: Character) {
        
        var characterneedHeals : Any = ""
        var characterTwo : Any = ""
        
        while characterneedHeals is String {
            print("voulez vous soigner un de vos personnage ou attaquer ?")
            
            print("si oui répondez 1 ou Oui")
            
            if let choiceAction = readLine() {
                
                if choiceAction == "1" || choiceAction == "oui" {
                    
                    repeat {
                        print("quel personnage voulez vous soigner :")
                        
                        characterneedHeals = playerOne.selectCharacter()
                        
                    } while characterneedHeals is Bool
                    
                    if let characterTwoSelected = characterneedHeals as? Character {
                        
                        let characterHealthMax = characterTwoSelected.charactersHealth()
                        
                        characterTwoSelected.health += 20
                        characterOneSelected.magic -= 20
                        
                        if characterHealthMax < characterTwoSelected.health {
                            
                            characterTwoSelected.health = characterHealthMax
                            
                        }
                        
                        print("\(characterOneSelected.name) soigne \(characterTwoSelected.name)")
                        
                    }
                    
                    
                } else if choiceAction == "1" || choiceAction == "attaquer" {
                    
                    castSpell(playerOne: playerOne, playerTwo: playerTwo, characterSelected: characterOneSelected)
                    
                    if characterTwo is String {
                        
                        repeat {
                            
                            characterTwo = playerTwo.selectCharacter()
                            
                        } while characterTwo is Bool
                        
                        if let characterTwoSelected = characterTwo as? Character {
                            attackPhase(characterOne: characterOneSelected, characterTwo: characterTwoSelected)
                        }
                    }
                    
                }
                removeCharacter()
                removePlayer()
            }
        }
    }
}
