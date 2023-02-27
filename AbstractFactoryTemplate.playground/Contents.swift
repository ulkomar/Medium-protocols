protocol CarsFactoryProtocol {
    func createSendan() -> Sedan
    func createCoupe() -> Coupe
}

protocol Sedan {
    var type: String { get set }
    func sayWho()
}

protocol Coupe {
    var type: String { get set }
    func sayWho()
} 

class ToyotaCoupe: Coupe {
    var type = "ToyotaCoupe"
    func sayWho() {
        print("I'm \(type)")
    }
}

class ToyotaSedan: Sedan {
    var type = "ToyotaSedan"
    func sayWho() {
        print("I'm \(type)")
    }
}

class FordCoupe: Coupe {
    var type = "FordCoupe"
    func sayWho() {
        print("I'm \(type)")
    }
}

class FordSedan: Sedan {
    var type = "FordSedan"
    func sayWho() {
        print("I'm \(type)")
    }
}

class ToyotaFactory: CarsFactoryProtocol {
    func createSendan() -> Sedan {
        return ToyotaSedan()
    }
    func createCoupe() -> Coupe {
        return ToyotaCoupe()
    }
}

class FordFactory: CarsFactoryProtocol {
    func createSendan() -> Sedan {
        return FordSedan()
    }
    func createCoupe() -> Coupe {
        return FordCoupe()
    }
}

var carFactory = ToyotaFactory()
var carSedan = carFactory.createSendan()
carSedan.sayWho()
 
