class Character {
    // création des paramètres commun à tous les personnages.
    var name : String = ""
    var health : Int
    var attack : Int
    
    init(health : Int, attack : Int) {
        self.name = ""
        self.health = health
        self.attack = attack
    }
}
