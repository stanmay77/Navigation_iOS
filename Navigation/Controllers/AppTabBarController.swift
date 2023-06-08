import UIKit


final class AppTabBarController: UITabBarController {
    
    init(vcs: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = vcs
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
