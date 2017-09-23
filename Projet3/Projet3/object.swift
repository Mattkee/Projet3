import Foundation

// This class will allow to set the property to an object.
class Objects {
    var name : String
    var attack : Int
    var defense : Int
    var magic : Int
    
    init (name : String , attack : Int , magic : Int, defense : Int) {
        self.name = name
        self.attack = attack
        self.defense = defense
        self.magic = magic
    }
}
