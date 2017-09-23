import Foundation

// This class will allow to set the property to an attack object.
class DefenseObject : Objects {
    
    var defensePoint : Int
    
    init(name : String, defensePoint: Int) {
        
        self.defensePoint = defensePoint
        super.init(name: name, attack: 0, magic: 0, defense : defensePoint)
    }
}
