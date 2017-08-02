class Character {
    // création des paramètres commun à tous les personnages.
    //var name : String = ""
    var health : Int
    var attack : Int
    
    init(health : Int, attack : Int) {
        //self.name = ""
        self.health = health
        self.attack = attack
    }
    func nameCharacter() -> String {
        var name : String? = "Character"
        
        repeat{
            name = String(readLine()!)
        } while((name?.characters.count)! <= 3)
        
        name = name!
        
        return name!
    }
}
// créer une methode namecharacter
