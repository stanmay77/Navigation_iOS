import UIKit


final class RootCoordinator: Coordinatable {
    var childCoordinators: [Coordinatable] = []
    private let appFactory: AppFactory
    
    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
    
    func start() -> UIViewController {
        let feedCoordinator = FeedCoordinator(moduleType: .feed, appFactory: appFactory)
        let profileCoordinator = ProfileCoordinator(moduleType: .login, appFactory: appFactory)
        let appTabBarVC = AppTabBarController(vcs: [feedCoordinator.start(), profileCoordinator.start()])
        childCoordinators.append(feedCoordinator)
        childCoordinators.append(profileCoordinator)
        return appTabBarVC
    }
}
