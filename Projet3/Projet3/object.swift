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
    
    // this propertie contains lot of attack objet for the random choice of the chest.
    static let listAttackObjects = [
        AttackObject(name: "épée simple", attackDamage: 10),
        AttackObject(name: "hache simple", attackDamage: 50),
        AttackObject(name: "épée lourde", attackDamage: 20),
        ]
    
    // this propertie contains lot of magic objet for the random choice of the chest.
    static let listHealsObjects = [
        MagicObject(name: "baguette", magicPoint: 30)
    ]
    
    // this method allow to define type of selected character's object.
    static func checkObjetsType (characterSelected : Character) {
        
        for object in characterSelected.objects {
            
            if let attackObject = object as? AttackObject {
                
                print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(attackObject.attackDamage)")
                print("")
                
            } else if let magicObject = object as? MagicObject {
                
                characterSelected.magicMax += magicObject.magicPoint
                
                print("\(characterSelected.name) reçoit l'objet \(characterSelected.objects[0].name) qui lui donne \(magicObject.magicPoint)")
                print("")
                
            }
        }
    }
    
    static func addCharacterObject (characterSelected : Character) {
        
        if Character.findCharacter(type: characterSelected) == "mage" {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Objects.listHealsObjects.count)))
            
            if characterSelected.objects.count != 0 {
                characterSelected.magicMax -= characterSelected.objects[0].magic
            }
            
            characterSelected.objects.removeAll()
            
            characterSelected.objects.append(Objects.listHealsObjects[openChestNumber])
            
            Objects.checkObjetsType(characterSelected: characterSelected)
            
        } else {
            
            let openChestNumber = Int(arc4random_uniform(UInt32(Objects.listAttackObjects.count)))
            
            characterSelected.objects.removeAll()
            
            characterSelected.objects.append(Objects.listAttackObjects[openChestNumber])
            
            Objects.checkObjetsType(characterSelected: characterSelected)
            
        }
    }
}
