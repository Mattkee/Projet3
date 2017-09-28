import Foundation

// This class will allow to set the property to an magic object.
class MagicObject : Objects {
    //this propertie set the point of magic for object
    var magicPoint : Int
    
    init(name : String, magicPoint : Int, type : String) {
        
        self.magicPoint = magicPoint
        super.init(name: name, attack: 0, magic: magicPoint, defense : 0, type : type)
    }
}
