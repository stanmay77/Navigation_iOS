class LoginInspector: LoginViewControllerDelegate {
    
    func check(_ login: String, _ password: String) -> Bool {
        return Checker.main.check(login, password)
    }
}
