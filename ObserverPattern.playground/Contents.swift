//MARK: Protocols
//BossProtocol - there are 3 necessary methods
protocol BossProtocol {
    func addMember(member: ObserverProtocol)
    func removeMember(member: ObserverProtocol)
    func notifyAll()
}

protocol ObserverProtocol {
    var memberId: Int {get}
    func sayOk()
}

//MARK: Classes
class Boss: BossProtocol {
    // List of all observers
    var observersList: [ObserverProtocol] = []
    
    //This function adds a new observer to the List
    func addMember(member: ObserverProtocol) {
        observersList.append(member)
    }
    
    //this function removes an observer from the List
    func removeMember(member: ObserverProtocol) {
        var indexAtArray = 0
        
        for element in observersList { // iterate through all elements
            if element.memberId == member.memberId {
                observersList.remove(at: indexAtArray)
            } else {
                indexAtArray += 1
            }
        }
    }
    
    // this function calls every observer method
    func notifyAll() {
        for element in observersList {
            element.sayOk()
        }
    }
}

class Observer: ObserverProtocol {
    let name: String
    let position: String
    let memberId: Int
    static var id: Int = 0 // It counts the amount of created instances
    
    init(name: String, position: String) {
        (self.name, self.position) = (name, position)
        Observer.id += 1
        self.memberId = Observer.id
    }
    
    // this is the function that is called from the Subject
    func sayOk() {
        print("\(self.name), \(self.position) начал работать!")
    }
}


//MARK: object initialization
var firstManager = Observer(name: "Владимир", position: "Менеджер по продажам")
var secondManager = Observer(name: "Маша", position: "Менеджер по продажам")
var thirdManager = Observer(name: "Агуша", position: "Менеджер по продажам")

var mark = Boss()
mark.addMember(member: firstManager)
mark.addMember(member: secondManager)
mark.addMember(member: thirdManager)

mark.notifyAll()


