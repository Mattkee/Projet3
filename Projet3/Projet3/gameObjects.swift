import Foundation

class Objects {
    var name : String
    var objectProfit : Int
    var typeObject : String
    
    init (name : String , objectProfit : Int , typeObject : String) {
        self.name = name
        self.objectProfit = objectProfit
        self.typeObject = typeObject
    }
}

class EpeeLarge : Objects {
    init(){
        super.init(name: "épée Large", objectProfit: 20, typeObject: "attaque")
    }
}

class MagicBaguette : Objects {
    init(){
        super.init(name: "Baguette magic", objectProfit: 30, typeObject: "magie")
    }
}
