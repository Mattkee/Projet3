import Foundation

// This class will allow to set the property to an magic object.
class MagicObject : Objects {
    
    var magicPoint : Int
    
    init(name : String, magicPoint : Int, type : String) {
        
        self.magicPoint = magicPoint
        super.init(name: name, attack: 0, magic: magicPoint, defense : 0, type : type)
    }
}
