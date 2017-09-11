import Foundation

// This class will allow to set the property to an object.
class Objects {
    var name : String
    var attack : Int
    var magic : Int
    
    init (name : String , attack : Int , magic : Int) {
        self.name = name
        self.attack = attack
        self.magic = magic
    }
    
    // this method allow to define type of selected character's object.
    static func checkObjetsType (characterSelected : Character) {
        
        for object in characterSelected.objects {
            
            if let attackObject = object as? AttackObject {
                
                print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(attackObject.attackDamage)")
                print("")
                
            } else if let magicObject = object as? MagicObject {
                
                print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(magicObject.magicPoint)")
                print("")
                
            }
        }
    }
}
