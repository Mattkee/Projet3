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
class Game {
    func bienvenue (){
        print("bienvenue dans le jeu")
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
        let name = readLine()
        return name
    }
}


