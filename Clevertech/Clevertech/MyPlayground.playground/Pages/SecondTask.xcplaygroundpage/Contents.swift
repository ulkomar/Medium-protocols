
//MARK: - Protocols
protocol VehicleProtocol {
    var year: Int { get }
    var model: String { get }
    var fuelType: String { get }
    var fuelConsumption: Int { get }
    var orderList: [OrderProtocol] { get set }
    
    func refuel(withVolume volume: Int)
    func repair()
    func unloadOrder()
    func getAllOrders()
}

protocol OrderProtocol {
    var startPoint: String? { get set }
    var destination: String? { get set }
    var volume: Int? { get set }
    var weight: Int? { get set }
    var type: ProductTypes? { get set }
    var passengerCount: Int? { get set }
    
    init(startPoint: String, destination: String, volume: Int, weight: Int, type: ProductTypes)
    
    init(startPoint: String, destination: String, passengerCount: Int)
}

//MARK: - Order class


class Order: OrderProtocol {
    
    //MARK: Variables
    
    var startPoint: String?
    var destination: String?
    var volume: Int?
    var weight: Int?
    var type: ProductTypes?
    var passengerCount: Int?
    
    //MARK: Inits
    
    required init(startPoint: String, destination: String, volume: Int, weight: Int, type: ProductTypes) {
        self.startPoint = startPoint
        self.destination = destination
        self.volume = volume
        self.weight = weight
        self.type = type
    }
    
    required init(startPoint: String, destination: String, passengerCount: Int) {
        self.startPoint = startPoint
        self.destination = destination
        self.passengerCount = passengerCount
    }

}

//MARK: - Type of body for a vehicle

// The Enum defines the type of body for a cargo vehicle
enum BodyTypes {
    case tent
    case refrigerator
    case tank
    func checkCompatibility(withProduct product: ProductTypes) -> Bool {
        switch self {
        case .tent:
            return product == .manufactured
        case .refrigerator:
            return product == .perishable || product == .manufactured
        case .tank:
            return product == .liquid
        }
    }
}

enum ProductTypes {
    case perishable // скоропортящиеся
    case manufactured // промтовары
    case liquid // жидкость
}

//MARK: - Types of vehicles

class Vehicle: VehicleProtocol {
    
    //MARK: Variables
    
    let year: Int
    let model: String
    let fuelType: String
    let fuelConsumption: Int
    var orderList = [OrderProtocol]()
    
    //MARK: Init
    
    init(year: Int, model: String, fuelType: String, fuelConsumption: Int) {
        self.year = year
        self.model = model
        self.fuelType = fuelType
        self.fuelConsumption = fuelConsumption
    }
    
    //MARK: Class function
    
    func refuel(withVolume volume: Int) {
        print("Заправлено на \(volume) литров")
    }
    
    func repair() {
        print("Отремонтированна")
    }
    
    func unloadOrder() {
        if orderList.count == 0 {
            print("Машина пуста!")
        } else {
            orderList.removeLast()
        }
    }
    
    func getAllOrders() {
        print("-----Загрузка-----")
        for (index, unit) in orderList.enumerated() {
            if let passengers = unit.passengerCount, passengers > 0 {
                print("idx: \(index). [\(unit.destination ?? "") - \(unit.startPoint ?? "")] Человек: \(passengers)")
            } else {
                print("idx: \(index). [\(unit.destination ?? "") - \(unit.startPoint ?? "")] Объем груза: \(unit.volume ?? 0); Масса: \(unit.weight ?? 0)")
            }
        }
        print("------------------")
    }
    
    
}

class CargoVehicle: Vehicle {
    
    //MARK: Variables

    var bodyVolume: Int
    var bodyType: BodyTypes
    var loadCapacity: Int
    
    //MARK: Init function
    
    init(year: Int, model: String, fuelType: String, fuelConsumption: Int, bodyVolume: Int, loadCapacity: Int, bodyType: BodyTypes) {
        self.bodyVolume = bodyVolume
        self.loadCapacity = loadCapacity
        self.bodyType = bodyType
        super.init(year: year, model: model, fuelType: fuelType, fuelConsumption: fuelConsumption)
    }
    
    //MARK: Overriding functions
    
    func loadOrder(unit: OrderProtocol) {
        if let type = unit.type, bodyType.checkCompatibility(withProduct: type) {
            if checkCapacity(volume: unit.volume ?? 0, loadCapacity: unit.weight ?? 0) {
                orderList.append(unit)
                print("Загружено!")
            }
        } else {
            print("Извините, но этот тип продукта не подходит для данной машины")
        }
    }
    
    //MARK: Class Functions
    
    func checkCapacity(volume vol: Int = 0, loadCapacity load: Int = 0) -> Bool {
        var allVolume = 0
        var allLoadCapacity = 0
        var newVolume = 0
        var newLoadCapacity = 0
        
        for unit in orderList {
            allVolume += unit.volume ?? 0
            allLoadCapacity += unit.weight ?? 0
        }
        
        newVolume = allVolume + vol
        newLoadCapacity = allLoadCapacity + load
        
        if newVolume > bodyVolume {
            print("К сожалению, объем загрузки превышает на \(newVolume - bodyVolume)")
            return false
        }
        
        if newLoadCapacity > loadCapacity {
            print("К сожалению, грузоподъемность меньше, чем ожидается загрузить. Перегруз на \(newLoadCapacity - loadCapacity)")
            return false
        }
        
        return true
    }
    
}

class PassengerVehicle: Vehicle {
    
    //MARK: Variables
    let passengerCapacity: Int
    
    //MARK: Init function
    
    init(year: Int, model: String, fuelType: String, fuelConsumption: Int, passengerCapacity: Int) {
        self.passengerCapacity = passengerCapacity
        super.init(year: year, model: model, fuelType: fuelType, fuelConsumption: fuelConsumption)
    }
    
    func loadOrder(unit: OrderProtocol) {
        if checkCapacity(passengers: unit.passengerCount ?? 0) {
            orderList.append(unit)
            print("Загружено!")
        }
    }
    
    func checkCapacity(passengers pass: Int = 0) -> Bool {
        var allPassengersCapacity = 0
        var newPassengersCapacity = 0
        
        for unit in orderList {
            allPassengersCapacity += unit.passengerCount ?? 0
        }
        
        newPassengersCapacity = allPassengersCapacity + pass
        
        if newPassengersCapacity > passengerCapacity {
            print("К сожалению, машина занята людьми. Перегруз на \(newPassengersCapacity - passengerCapacity) человека")
            return false
        }
        
        return true
    }
}

class CargoPassengerVehicle: Vehicle {
    
    //MARK: Variables

    let passengerCapacity: Int
    let loadCapacity: Int
    
    //MARK: Init function
    
    init(year: Int, model: String, fuelType: String, fuelConsumption: Int, passengerCapacity: Int, loadCapacity: Int) {
        self.passengerCapacity = passengerCapacity
        self.loadCapacity = loadCapacity
        super.init(year: year, model: model, fuelType: fuelType, fuelConsumption: fuelConsumption)
    }
    
    func loadOrder(unit: OrderProtocol) {
        if checkCapacity(passengers: unit.passengerCount ?? 0, load: unit.volume ?? 0) {
            orderList.append(unit)
            print("Загружено!")
        }
    }
    
    func checkCapacity(passengers pass: Int = 0, load: Int = 0) -> Bool {
        var allPassengersCapacity = 0
        var newPassengersCapacity = 0
        var allLoadCapacity = 0
        var newLoadCapacity = 0
        
        for unit in orderList {
            allPassengersCapacity += unit.passengerCount ?? 0
            allLoadCapacity += unit.volume ?? 0
        }
        
        newPassengersCapacity = allPassengersCapacity + pass
        newLoadCapacity = allLoadCapacity + load
        
        if newPassengersCapacity > passengerCapacity {
            print("К сожалению, машина занята людьми. Перегруз на \(newPassengersCapacity - passengerCapacity) человека")
            return false
        }
        
        if newLoadCapacity > loadCapacity {
            print("К сожалению, объем загрузки превышает на \(newLoadCapacity - loadCapacity)")
            return false
        }
        
        return true
    }
    
}


let product1 = Order(startPoint: "Minsk", destination: "Mogilev", volume: 30, weight: 20, type: .liquid)
let product2 = Order(startPoint: "Minsk", destination: "Kyiv", passengerCount: 2)
let product3 = Order(startPoint: "Minsk", destination: "Praha", passengerCount: 3)
let product4 = Order(startPoint: "Minsk", destination: "Grodno", passengerCount: 6)
let product5 = Order(startPoint: "Minsk", destination: "Dudapesht", volume: 100, weight: 40, type: .manufactured)
let product6 = Order(startPoint: "Minsk", destination: "Chernigov", volume: 80, weight: 50, type: .perishable)
let product7 = Order(startPoint: "Minsk", destination: "Lviv", volume: 40, weight: 60, type: .liquid)

let cargoPassCar = CargoPassengerVehicle(year: 2000, model: "Volvo", fuelType: "D-95", fuelConsumption: 10, passengerCapacity: 6, loadCapacity: 30)
cargoPassCar.loadOrder(unit: product4)
let cargoTankCar = CargoVehicle(year: 2000, model: "Volvo", fuelType: "D-95", fuelConsumption: 9, bodyVolume: 300, loadCapacity: 400, bodyType: .tank)
cargoTankCar.loadOrder(unit: product1)
cargoTankCar.loadOrder(unit: product7)
let cargoCar = CargoVehicle(year: 2000, model: "Volvo", fuelType: "D-92", fuelConsumption: 12, bodyVolume: 500, loadCapacity: 700, bodyType: .refrigerator)
cargoCar.loadOrder(unit: product5)
cargoCar.loadOrder(unit: product6)
let passCar = CargoPassengerVehicle(year: 200, model: "Volvo", fuelType: "D-95", fuelConsumption: 13, passengerCapacity: 10, loadCapacity: 200)
passCar.loadOrder(unit: product2)
passCar.loadOrder(unit: product3)

cargoCar.unloadOrder()
cargoTankCar.unloadOrder()
cargoPassCar.refuel(withVolume: 50)
cargoTankCar.repair()
