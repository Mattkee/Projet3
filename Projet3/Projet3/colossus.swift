import Foundation

// This class will allow to set the property of the colossus type character
class Colossus : Character {
    
    init(){
        super.init(health: 500, attack: 3, magic: 0)
        
        self.attack = attack
        
    }
}
