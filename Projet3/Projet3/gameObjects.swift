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
class Epee : Objects {
    init(){
        super.init(name: "épée", objectProfit: 10, typeObject: "attaque")
    }
}
class Hache : Objects {
    init(){
        super.init(name: "Hache", objectProfit: 50, typeObject: "attaque")
    }
}
class EpeeLarge : Objects {
    init(){
        super.init(name: "épée Large", objectProfit: 40, typeObject: "attaque")
    }
}
class MagicBaguette : Objects {
    init(){
        super.init(name: "Baguette magic", objectProfit: 30, typeObject: "magie")
    }
}
