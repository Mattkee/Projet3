import Foundation

// This class can manage any properties or methods that concern each player.
class Player{
    
    // this propertie will store the name of selected player.
    var teamName : String = ""
    
    // This property will store the number of the selected player.
    var teamNumber : Int = 0
    
    // this method will store the characters of selected player
    var teamCharacter = [Character]()
    
    // this method will allow to define the name of the player.
    public func setTeamName(name:String){
        self.teamName = name
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
    public func seeTeamMembers() {
        print("Voici la liste des personnages de \(self.teamName) :")
        print("")
        
        for character in teamCharacter {
            print("\(character.characterNumber + 1). le personnage \(character.name) qui est un \(character.findTypeCharacter())")
        }
    }
    
    // this method will allow to return the team number of selected player.
    public func getPlayernumber () -> Int {
        return teamNumber
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
            } while (game.checkName(nameChoice: teamName) == true)
        } while((teamName.characters.count) <= 3)
        
        return teamName
    }
    
    
    // this method allow to add new character to selected player.
    func addNewCharacter(personnage : Character, characterNumber : Int) {
        
        // these lines will allow to add parametre for this new character.
        personnage.nameCharacter()
        personnage.characterNumber = characterNumber
        // this line will allow to add this new character to selected player's character array.
        self.teamCharacter.append(personnage)
        
        print("")
        print("\(self.teamName) a \(self.teamCharacter.count) personnage.")
        
        // this line is to display list of existing selected player's characters.
        self.seeTeamMembers()
        
    }
    
    // this static method allow to initialize players's characters.
    func initializeTeamsCharacters(){
        
        // this loop will allow to add new character to selected player while selected player'characters is not equal 3
        while self.teamCharacter.count < 3 {
            print("")
            print(" Joueur \(self.teamName) : Choisissez le personnage \(self.teamCharacter.count + 1) de votre équipe parmis les choix suivants : "
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
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count)
                    
                case "2":
                    
                    let personnage = Wizard()
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count)
                    
                case "3":
                    
                    let personnage = Colossus()
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count)
                    
                case "4":
                    
                    let personnage = Dwarf()
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count)
                    
                default:
                    
                    print("")
                    print("Je n'ai pas compris, veuillez choisir un numéro de 1 à 4 selon le personnage choisi.")
                }
            }
        }
    }
    
    // this method allow to select a character for different battle's phase.
    func selectCharacter() -> Any {
        
        self.seeTeamMembers()
        
        print("quel personnage voulez vous choisir :")
        print("")
        
            print("indiquez un nom de personnage ou son numéro pour le sélectionner")
        
        if let choiceCharacter = readLine() {
            
            for character in self.teamCharacter {
                
                if choiceCharacter == character.name || choiceCharacter == String(character.characterNumber + 1) {
                        return character
                }
            }
        }
        return false
    }
    
    
    // this method will allow to remove a character when this character's health is less than 1
    public static func removeCharacter() {
        for player in game.players {
            var characterNumber = 0
            for character in player.teamCharacter {
                
                if character.health < 1 {
                    player.teamCharacter.remove(at: characterNumber)
                }
                characterNumber += 1
            }
        }
    }
    
}
