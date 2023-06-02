protocol LoginViewControllerDelegate: AnyObject {
    func check(_ login: String, _ password: String) -> Bool
}


final class Checker {
    
    static let main = Checker()
    
    private let login: String = "tim@apple.com"
    private let password: String = "tim"

    private init() { }
    
    func check(_ login: String, _ password: String) -> Bool {
        if login == self.login && password == self.password {
            return true
        } else
        {
            return false
        }
    }
}
