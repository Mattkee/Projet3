class Player{
    private var teamName : String = ""
    private var teamCharacter = [Character]()

    //init(teamName : String,teamCharacter : Dictionary<String , Character>){
        //self.teamName = teamName
        //self.teamCharacter = teamCharacter
    //}
    public func setTeamName(name:String){
        self.teamName = name
    }
    public func getTeamName() -> String {
        return self.teamName
    }
    public func setTeamMember(member : Character) {
        self.teamCharacter.append(member)
    }
    public func getTeamMembersNumber() -> Int {
        return self.teamCharacter.count
    }
}
