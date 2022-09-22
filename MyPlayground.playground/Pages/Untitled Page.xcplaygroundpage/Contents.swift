struct Point {
    var x: Int
    var y: Int
    var center: Double {
        get {
            Double(self.x + self.y)
        }
        set(value) {
            self.x = self.x - Int(value)
            self.y = self.y - Int(value)
        }
    }
}

var newProperty = Point(x: 5, y: 6)
newProperty.center = 3
newProperty


protocol FirstOne {
    var firstProtocolProperty: Int {get set} // требование к объекту, чтобы было хранимое свойство типа INT
}

protocol SecondOne {
    var secondProtocolProperty: Int {get set} // еще одно требование к объекту, чтобы было хранимое свойство типа INT
}

// инициализируем класс CAR с двумя свойствами. Класс подписан на два протокола => должен удовлетворять
// требований обоих протоколов
class Car: FirstOne, SecondOne {
    var firstProtocolProperty: Int
    var secondProtocolProperty: Int
    
    init(_ firstProtocolProperty: Int, _ secondProtocolProperty: Int) {
        self.firstProtocolProperty = firstProtocolProperty
        self.secondProtocolProperty = secondProtocolProperty
    }
}


protocol UserProtocol {
    var userName: String {get}
    mutating func changeName(_ newName: String)
}

class UserClass: UserProtocol {
    var userName = "Ulad"
    func changeName(_ newName: String) -> Int{
        self.userName = newName
        return 0
    }
}

struct StructName: UserProtocol {
    var userName = "Ulad"
    mutating func changeName(_ newName: String) {
        self.userName = newName
    }
}

protocol MyProtocol {
    var newRay: Int {get set}
}

protocol NewProt: class, MyProtocol {
    var newPay: Int {get set}
}

struct NewStruct: MyProt {
    var newRay: Int = 5
}
