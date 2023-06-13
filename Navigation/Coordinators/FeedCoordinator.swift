import UIKit


final class FeedCoordinator: ModuleCoordinatable {
    var module: Module?
    var moduleType: Module.ModuleType
    private let appFactory: AppFactory
    weak var coordinator: RootCoordinator?
    
    private(set) var childCoordinators: [Coordinatable] = []

    
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
