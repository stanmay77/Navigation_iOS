protocol LoginFactory {
    static func makeLoginInspector() -> LoginInspector
}

class MyLoginFactory: LoginFactory {
    
    static func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
