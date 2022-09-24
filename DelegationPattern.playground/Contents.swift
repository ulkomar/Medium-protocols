//MARK: Protocols
protocol AccountingDelegate {
    mutating func doAccounting()
}

protocol DirectorProtocol {
    var accountantDel: AccountingDelegate? { get set }
    mutating func doAccounting()
    mutating func doManagement()
}

//Structures

struct Accountant: AccountingDelegate {
    func doAccounting() {
        print("Accountant does accounting")
    }
}

struct Director {
    var accountantDel: AccountingDelegate?
    mutating func doAccounting() {
        accountantDel?.doAccounting()
    }
    mutating func doManagement() {
        print("Director does managament work")
    }
}

var director = Director()
director.accountantDel = Accountant()
director.doManagement()
director.doAccounting()

