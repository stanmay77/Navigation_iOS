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
        self.module = module
        return vc
    }
}
