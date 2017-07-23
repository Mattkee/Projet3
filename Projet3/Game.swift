//======================
// MARK: - Parameters
//======================
class Personnage {
    class Character {
        // création des paramètres commun à tous les personnages.
        var name : String
        var health : Int
        var attack : Int
        
        init(name : String, health : Int, attack : Int) {
            self.name = name
            self.health = health
            self.attack = attack
        }
    }
    
    class Warrior : Character {
        // création du personnage de type guerrier.
        var epee = 10
        init(name : String) {
            super.init(name: name, health: 100, attack: 10)
            self.attack = attack
            attack = attack + epee
        }
    }
    class Wizard : Character {
        // création du personnage de type Mage.
        func soign () {
            
        }
        var magie = 100
        init(name : String){
            super.init(name: name, health: 60, attack: 2)
        }
    }
    class Colossus : Character {
        // création du personnage de type Colosse.
        init(name : String){
            super.init(name: name, health: 500, attack: 3)
        }
    }
    class Dwarf : Character {
        // création du personnage de type Nain.
        var hache = 50
        init(name : String){
            super.init(name: name, health: 30, attack: 5)
            self.attack = attack
            attack = attack + hache
        }
    }
}

var personnage = Personnage()

class Game {
    var tabPerso = [String:String]()
    func bienvenue (){
        print("bienvenue dans le jeu")
        menuPrinc()
    }
    func menuPrinc (){
        print("quel action voulez vous faire ?"
            + "\n1. choisir équipe 1"
            + "\n2. choisir équipe 2"
            + "\n3. Jouer")
        if let choice = readLine(){
            switch choice {
            case "1":
                donnerNomEquipe1()
                choisirEquipe()
            case "2":
                print("menu équipe 2")
            case "3":
                print("menu jouer")
            default:
                print("je n'ai pas compris")
            }
        }
    }
    func donnerNomEquipe1() -> String? {
        print("Quel nom voulez vous donner à l'équipe ?")
        if let choice = readLine() {
            if let name = String(choice){
                return name
            }
        }
        print("je n'ai pas compris")
        return nil
    }
    func name() -> String? {
        print("Quel nom voulez vous donner à l'équipe ?")
        if let choice = readLine() {
            if let name = String(choice){
                return name
            }
        }
        print("je n'ai pas compris")
        return nil
    }
    func choisirEquipe() {
        print("Quel type de personnage voulez vous choisir?"
            + "\n1. Warrior"
            + "\n2. Wizard"
            + "\n3. Colossus"
            + "\n4. Dwarf")
        if let choice = readLine(){
            switch choice {
            case "1":
                print("Choisir le nom du guerrier")
                name()
                let test = name()
                tabPerso ["warrior"] = test
                print("vous avez choisi un guerrier appelé \(test)")
            case "2":
                print("Choisir le nom du Mage")
            case "3":
                print("Choisir le nom du Colosse")
            case "4":
                print("Choisir le nom du Nain")
            default:
                print("Je n'ai pas compris")
            }
        }
    }
}
var game = Game()

class Joueur {
    var supName = game.donnerNomEquipe1()
    var name = game.name()
    
}
var joueur = Joueur()
