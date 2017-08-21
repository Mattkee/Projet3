class Fight {
    var playerNumber : Int = 0
    var playerSelected : String = ""
    var battleCharacter = [Character]()
    
    func battle() {
        playerSelected = game.playersName[playerNumber]
        
        for _ in 1 ... 2 {
            for (name, _) in game.players {
                let teamSelectedCharacter = [Character]()
                for player in game.players.values {
                    if playerSelected = name {
                teamSelectedCharacter.append(
                    print("joueur \(playerSelected) avec lequel de vos personnage voulez vous affronter votre adversaire"
                    + "\n1. \(game.players[playerSelected]!) \(teamSelectedCharacter) "
                    + "\n2. Mage"
                    + "\n3. Colosse")
                }
            }
        }
    }
}
