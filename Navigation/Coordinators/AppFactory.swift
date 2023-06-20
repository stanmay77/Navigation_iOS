import UIKit


final class AppFactory {
    func makeModule(withType type: Module.ModuleType) -> Module {
        switch type {
        case .feed:
            //let feedModel = FeedModel()
            //let view = UINavigationController(rootViewController: FeedViewController(model: feedModel))
            
            let view = UINavigationController(rootViewController: InfoViewController())
            return Module(moduleType: .feed, viewModel: nil, view: view)
            
        case .login:
            let viewModel = LoginViewModel()
            let view = UINavigationController(rootViewController: LogInViewController(viewModel: viewModel))
            return Module(moduleType: .login, viewModel: viewModel, view: view)
        }
    }
    
}


