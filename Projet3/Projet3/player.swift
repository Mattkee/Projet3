import Foundation

// This class can manage any properties or methods that concern each player.
class Player{
    
    // this propertie will store the name of selected player.
    private var teamName : String = ""
    
    // This property will store the number of the selected player.
    private var teamNumber : Int = 0
    
    // this method will store the characters of selected player
    var teamCharacter = [Character]()
    
    // this method will allow to define the name of the player.
    public func setTeamName(name:String){
        self.teamName = name
    }
    
    // this method will allow to return teamname of selected player.
    public func getTeamName() -> String {
        return self.teamName
    }
    
    // this method will allow to return the characters of selected player.
    public func getTeamCharacter(characterNumber : Int) -> Character {
        return self.teamCharacter[characterNumber]
    }
    
    // this method will allow to add a new character to selected player.
    public func setTeamMember(member : Character) {
        self.teamCharacter.append(member)
    }
    
    // this method will allow to return the number of character of selected player.
    public func getTeamMembersNumber() -> Int {
        return self.teamCharacter.count
    }
    
    // this method will allow to display selected player all characters.
    public func seeTeamMembers(player : Player) {
        print("Voici la liste des personnages de \(player.getTeamName()) :")
        print("")
        print("choisissez un personnage")
        print("")
        for character in teamCharacter {
            print("\(character.characterNumber + 1). le personnage \(character.name) qui est un \(Character.findCharacter(type: character))")
        }
    }
    
    // this method will allow to return the team number of selected player.
    public func getPlayernumber () -> Int {
        return teamNumber
    }
    
    // this static method allow to create the players.
    public static func initializeTeamsName(playerNumber : Int){
        
        // this let propertie allow to create instance of class player.
        let team = Player()
        
        // this let propertie allow to define name of instance team.
        let teamName = team.playerName(playerNumber : playerNumber)
        
        // add teamName in instance Team, and after add team in the array players.
        team.setTeamName(name : teamName)
        team.teamNumber = playerNumber
        game.players.append(team)
        
        // this loop will allow to display stored players.
        print("")
        for player in game.players {
            
            print("Le joueur \(player.teamNumber + 1) s'appelle " + (player.getTeamName()))
        }
    }
    
    // this method allow to define player name.
    public func playerName(playerNumber : Int) -> String {
        
        print("")
        print("Joueur \(playerNumber + 1) Quel est le nom de votre equipe")
        
        // these two repeat loops will allow to choice name for team, these loops running while define name is already exist or if define name is less than 3 characters. if condition are true this method return teamName.
        repeat{
            repeat { print("veuillez donner un nom correct de minimum 4 caractères.")
                if let setName = readLine(){
                    self.teamName = String(setName)
                }
            } while (Player.checkName(nameChoice: teamName) == true)
        } while((teamName.characters.count) <= 3)
        
        return teamName
    }
    
    // this method allow to check if a name is already exist in player or player's characters.
    public static func checkName(nameChoice : String) -> Bool{
        
        // this loop will observe players name.
        for player in game.players {
            
            if nameChoice.lowercased() == player.getTeamName().lowercased() {
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
    
    // this method allow to add new character to selected player.
    static func addNewCharacter(personnage : Character, playerNumber : Int) {
        
        // these lines will allow to add parametre for this new character.
        personnage.nameCharacter()
        personnage.characterNumber = game.players[playerNumber].getTeamMembersNumber()
        
        // this line will allow to add this new character to selected player's character array.
        game.players[playerNumber].setTeamMember(member: personnage)
        
        print("")
        print("\(game.players[playerNumber].getTeamName()) a \(game.players[playerNumber].getTeamMembersNumber()) personnage.")
        
        // this line is to display list of existing selected player's characters.
        game.players[playerNumber].seeTeamMembers(player: game.players[playerNumber])
        
    }
    
    // this static method allow to initialize players's characters.
    public static func initializeTeamsCharacters(playerNumber : Int){
        
        // this loop will allow to add new character to selected player while selected player'characters is not equal 3
        while game.players[playerNumber].teamCharacter.count < 3 {
            print("")
            print(" Joueur \(playerNumber + 1) : Choisissez le personnage \(game.players[playerNumber].teamCharacter.count + 1) de votre équipe parmis les choix suivants : "
                + "\n1. Combattant"
                + "\n2. Mage"
                + "\n3. Colosse"
                + "\n4. Nain")
            print("quel est votre choix?")
            
            // the player will have to choose among four proposal for type of character and after add this character to player selected's array of characters.
            if let choixPersonnage = readLine() {
                
                switch choixPersonnage {
                case "1":
                    
                    let personnage = Warrior()
                    Player.addNewCharacter(personnage: personnage, playerNumber : playerNumber)
                    
                case "2":
                    
                    let personnage = Wizard()
                    Player.addNewCharacter(personnage: personnage, playerNumber : playerNumber)
                    
                case "3":
                    
                    let personnage = Colossus()
                    Player.addNewCharacter(personnage: personnage, playerNumber : playerNumber)
                    
                case "4":
                    
                    let personnage = Dwarf()
                    Player.addNewCharacter(personnage: personnage, playerNumber : playerNumber)
                    
                default:
                    
                    print("")
                    print("Je n'ai pas compris, veuillez choisir un numéro de 1 à 4 selon le personnage choisi.")
                }
            }
        }
    }
    
    // this method allow to display all characters to each players.
    public static func seeAllTeamCharacter() {
        
        for player in game.players {
            print("")
            print("pour l'équipe de \(player.getTeamName()) voici la liste des personnages :")
            print("")
            for character in player.teamCharacter {
                print("\(character.characterNumber + 1). le personnage \(character.name) qui est un \(Character.findCharacter(type: character)) et il a \(character.health) pt de vie et a \(Character.calculateDamage(characterSelected:character))pt d'attack total.")
            }
        }
    }
    
    // This method will allow to randomly choose which players attack first and which players defended.
    static func playerChoiceBattle() {
        
        // this line will randomly choose which players attack first.
        let playerNumber = Int(arc4random_uniform(UInt32(game.players.count)))
        game.playerAttack = game.players[playerNumber]
        
        if playerNumber == 1 {
            game.playerDefender = game.players[playerNumber - 1]
        } else {
            game.playerDefender = game.players[playerNumber + 1]
        }
        
        print("")
        print("\(game.playerAttack.getTeamName()) vous débutez le combat")
    }
    
    // this method allow to select a character for different battle's phase.
    static func selectCharacter(player : Player) {
        
    
        player.seeTeamMembers(player: player)
        
        print("quel personnage voulez vous choisir :")
        print("")
        
            print("indiquez un nom de personnage ou son numéro pour le sélectionner")
        
        if let choiceCharacter = readLine() {
            
            for character in player.teamCharacter {
                
                if choiceCharacter == character.name || choiceCharacter == String(character.characterNumber + 1) {
                        game.characterBattle.append(character)
                }
            }
        }
    }
    
    // This method will allow to carry out the phase of attack between two character. 
    static func attackPhase(playerOne : Player, playerTwo : Player) {
        
        game.players[playerTwo.teamNumber].teamCharacter[game.characterBattle[1].characterNumber].health -= Character.calculateDamage(characterSelected: game.players[playerOne.teamNumber].teamCharacter[game.characterBattle[0].characterNumber])
        print("\(playerOne.getTeamName()) attaque \(playerTwo.getTeamName()) et lui inflige \(Character.calculateDamage(characterSelected: playerOne.teamCharacter[game.characterBattle[0].characterNumber])) point de dégat.")
    }
    
    // this method will allow to remove a character when this character's health is less than 1
    public static func remoteCharacter() {
        for player in game.players {
            for character in player.teamCharacter {
                if character.health < 1 {
                    player.teamCharacter.remove(at: character.characterNumber)
                }
            }
        }
    }
    
    // this method will allow to remove a player when this player's number of character is 0
    public static func remotePlayer() {
        for player in game.players {
            let numberCharacter = player.teamCharacter.count
            if numberCharacter == 0 {
                game.players.remove(at: player.teamNumber)
                print(" le joueur \(player.teamName)")
            }
        }
    }
}
