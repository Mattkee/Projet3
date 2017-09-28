import Foundation

// This class will allow to set the property to an attack object.
class DefenseObject : Objects {
    // this propertie set the point of defense for object
    var defensePoint : Int
    
    init(name : String, defensePoint: Int, type: String) {
        
        self.defensePoint = defensePoint
        super.init(name: name, attack: 0, magic: 0, defense : defensePoint, type : type)
    }
}
