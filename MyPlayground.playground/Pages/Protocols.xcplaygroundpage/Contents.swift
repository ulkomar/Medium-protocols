protocol InterviewProtocol {
    var lastName: String { get set }
    
    func successOfinterview()
    func failureOfInterview()
}

class Programmer: InterviewProtocol {
    var lastName: String = ""
    var inSearchOfJob: Bool?
    var skill: String?
    
    func successOfinterview() {
        if inSearchOfJob == true {
            print("Подходит!")
            okArray.append(self)
        }
    }
    
    func failureOfInterview() {
        if inSearchOfJob == false {
            print("Не подходит!")
            failArray.append(self)
        }
    }
}

var okArray = [InterviewProtocol]()
var failArray = [InterviewProtocol]()

var vanya = Programmer()
vanya.lastName = "Petrov"
vanya.inSearchOfJob = true
vanya.successOfinterview()

okArray

