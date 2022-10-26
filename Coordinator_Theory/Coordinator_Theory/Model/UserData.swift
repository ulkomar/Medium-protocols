protocol UserDataProtocol {
    var userName: String? { get set }
    var login: String? { get set }
    var password: String? { get set }
    var age: Int? { get set }
}

class UserData: UserDataProtocol {
    var userName: String?
    var login: String?
    var password: String?
    var age: Int?
}
