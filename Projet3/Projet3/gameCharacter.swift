class Character {
    // création des paramètres commun à tous les personnages.
    var name : String = ""
    var health : Int
    var attack : Int
    
    init(health : Int, attack : Int) {
        //self.name = ""
        self.health = health
        self.attack = attack
    }
    func nameCharacter() -> String {
        repeat{
            if let setName = readLine(){
                name = String(setName)
            }
        } while((name.characters.count) <= 3)
        
        return name
    }
}
// créer une methode namecharacter
