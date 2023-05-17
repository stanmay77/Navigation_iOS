protocol LoginViewControllerDelegate: AnyObject {
    func check(_ login: String, _ password: String) -> Bool
}


final class Checker {
    
    static let main = Checker()
    
    private let login: String = "tim"
    private let password: String = "tim"

    private init() { }
    
    func check(_ login: String, _ password: String) -> Bool {
        if login == login && password == password {
            return true
        } else
        {
            return false
        }
    }
}
