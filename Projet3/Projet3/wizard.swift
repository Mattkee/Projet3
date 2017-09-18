import Foundation

// This class will allow to set the property of the wizard type character.
class Wizard : Character {
    

    init(){
        super.init(health: 60, attack: 2, magic: 100, magicMax : 100)
        
        self.magic = magic
        
    }
}
