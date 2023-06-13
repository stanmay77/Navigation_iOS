import UIKit


final class ProfileCoordinator: ModuleCoordinatable {
    var module: Module?
    var moduleType: Module.ModuleType
    private(set) var childCoordinators: [Coordinatable] = []
    private let appFactory: AppFactory
    
    init(moduleType: Module.ModuleType, appFactory: AppFactory) {
        self.moduleType = moduleType
        self.appFactory = appFactory
    }
    
    
    func start() -> UIViewController {
        let module = appFactory.makeModule(withType: moduleType)
        let vc = module.view
        vc.tabBarItem = moduleType.tabBarItem
        (module.viewModel as? LoginViewModel)?.coordinator = self
        self.module = module
        return vc
    }
    
    func pushProfileVC(_ user: User) {
        let profVC = ProfileViewController(userLogged: user)
        (module?.view as? UINavigationController)?.pushViewController(profVC, animated: true)

    }
    
    func presentAlert() {
        let alertVC = UIAlertController(title: "Error", message: "User not registered or wrong password entered!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(alertAction)
        (module?.view as? UINavigationController)?.present(alertVC, animated: true)
    }
}
