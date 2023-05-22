import UIKit


protocol UserService {
    func getUserByLogin(for login: String?) -> User?
}


final class User {
    let login: String
    let fullName: String
    let avatar: UIImage?
    let status: String
    
    
    init(login: String, fullName: String, avatar: UIImage?, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

class CurrentUserService: UserService {
    
    let userLogged = User(login: "tim@apple.com", fullName: "Tim Cook", avatar: UIImage(named: "tim"), status: "online")
    
    func getUserByLogin(for login: String?) -> User? {
        guard let login = login else { return nil }
        
        if login == userLogged.login {
            return userLogged
        }
        return nil
    }
}

class TestUserService: UserService {
    
    let userLogged = User(login: "tim@apple.com", fullName: "Test User", avatar: UIImage(systemName: "phone.down.circle"), status: "test")
   
    func getUserByLogin(for login: String?) -> User? {
        guard let login = login else { return nil }
        
        if login == userLogged.login {
            return userLogged
        }
        return nil
    }
}
