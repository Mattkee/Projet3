class Player{
    private var teamName : String = ""
    private var teamCharacter = [String : Character]()
// il serait bon de réutiliser un dictionnaire, afin de facilité le travail plus tard, en particulier sur l'utilisation de nom unique.

    public func setTeamName(name:String){
        self.teamName = name
    }
    public func getTeamName() -> String {
        return self.teamName
    }
    public func setTeamMember(name : String , member : Character) {
        self.teamCharacter[name] = member
    }
    public func getTeamMembersNumber() -> Int {
        return self.teamCharacter.count
    }
    public func playerName() -> String {

        repeat{
            if let setName = readLine(){
                teamName = String(setName)
            }
        } while((teamName.characters.count) <= 3)
        
        return teamName
    }
    public func displayPlayers() {
        print("le joueur 1 est \(game.players[1])")
        print("il a ")
    }
}
