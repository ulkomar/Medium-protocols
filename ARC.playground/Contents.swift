class House {
    var title: String
    var owner: Human?
    
    init(title: String, owner: Human? = nil) {
        print("House was created \(title)")
        self.title = title
        self.owner = owner
    }
    
    deinit {
        print("House was deleted \(self.title)")
    }
}

class Human {
    var name: String
    var houses: [House] = []
    
    init(name: String) {
        print("Human was created \(name)")
        self.name = name
    }
    
    func addHouse(house: House) {
        self.houses.append(house)
    }
    
    deinit {
        print("Human was deleted \(self.name)")
    }
}

if true {
    let houseOwner = Human(name: "Vlad")
    
    if true {
        let house = House(title: "Private house", owner: houseOwner)
        houseOwner.addHouse(house: house)
    }
    
    let secondHouse = House(title: "Flat", owner: houseOwner)
    houseOwner.addHouse(house: secondHouse)
}







