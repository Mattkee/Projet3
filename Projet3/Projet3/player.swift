import Foundation

// This class can manage any properties or methods that concern each player.
class Player{
    
    // this propertie will store the name of selected player.
    var teamName : String = ""
    
    // This property will store the number of the selected player.
    var teamNumber : Int = 0
    
    // this method will store the characters of selected player
    var teamCharacter = [Character]()
    
    // this method will allow to display selected player all characters.
    public func seeTeamMembers() {
        print("Voici la liste des personnages de \(self.teamName) :")
        print("")
        
        var number = 1
        
        for character in teamCharacter {
            character.characterNumber = number
            print("\(character.characterNumber). le personnage \(character.name) qui est un \(character.type)")
            number += 1
        }
        print("")
    }
    
    // this method allow to add new character to selected player.
    func addNewCharacter(personnage : Character, characterNumber : Int, players : [Player]) {
        
        // these lines will allow to add parametre for this new character.
        personnage.name = Tools.choiceName(players: players)
        personnage.characterNumber = characterNumber
        // this line will allow to add this new character to selected player's character array.
        self.teamCharacter.append(personnage)
        
        print("")
        print("\(self.teamName) a \(self.teamCharacter.count) personnage.")
        
        // this line is to display list of existing selected player's characters.
        self.seeTeamMembers()
        
    }
    
    // this method allow to initialize players's characters.
    func initializeTeamsCharacters(players : [Player]){
        
        // this loop will allow to add new character to selected player while selected player'characters is not equal 3
        while self.teamCharacter.count < 3 {
            
            print("Joueur \(self.teamName) : Choisissez le personnage \(self.teamCharacter.count + 1) de votre équipe parmis les choix suivants : "
                + "\n"
                + "\n1. Combattant        (100 pts de vie, 10 pts d'attaque + une épee)"
                + "\n2. Mage         (60 pts de vie, 2 pts d'attaque, 100 pts de magie)"
                + "\n3. Colosse         (500 pts de vie, 3 pts d'attaque)"
                + "\n4. Nain         (30 pts de vie, 5 pts d'attaque + une hache)")
            print("quel est votre choix?")
            
            // the player will have to choose among four proposal for type of character and after add this character to player selected's array of characters.
            if let choixPersonnage = readLine() {
                
                switch choixPersonnage {
                case "1":
                    
                    let personnage = Warrior()
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count, players: players)
                    
                case "2":
                    
                    let personnage = Wizard()
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count, players: players)
                    
                case "3":
                    
                    let personnage = Colossus()
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count, players: players)
                    
                case "4":
                    
                    let personnage = Dwarf()
                    self.addNewCharacter(personnage: personnage, characterNumber: teamCharacter.count, players: players)
                    
                default:
                    
                    print("")
                    print("Je n'ai pas compris, veuillez choisir un numéro de 1 à 4 selon le personnage choisi.")
                }
            }
        }
    }

}
