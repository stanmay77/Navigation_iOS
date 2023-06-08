import UIKit


final class AppFactory {
    func makeModule(withType type: Module.ModuleType) -> Module {
        switch type {
        case .feed:
            let feedModel = FeedModel()
            let view = UINavigationController(rootViewController: FeedViewController(model: feedModel))
            return Module(moduleType: .feed, view: view)
            
        case .login:
            let view = UINavigationController(rootViewController: LogInViewController())
            return Module(moduleType: .login, view: view)
        }
    }
    
}


