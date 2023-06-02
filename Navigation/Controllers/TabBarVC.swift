//
//  TabBarVC.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/4/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    func setupUI() {
        let feedModel = FeedModel()
        let feedNavVC = UINavigationController(rootViewController: FeedViewController(model: feedModel))
        let profileNavVC = UINavigationController(rootViewController: LogInViewController())
        
        feedNavVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "square.and.pencil.circle"), tag: 0)
        profileNavVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 0)
        
        UINavigationBar.appearance().standardAppearance.configureWithOpaqueBackground()
       // UINavigationBar.appearance().backgroundColor = .systemRed
        
        self.tabBar.barTintColor = UIColor(red: 53.0, green: 144.0, blue: 243.0, alpha: 0.6)
        
        UITabBar.appearance().backgroundColor = UIColor(red: 53.0, green: 144.0, blue: 243.0, alpha: 0.6)
     //     UITabBar.appearance().isTranslucent = true
//
        setViewControllers([feedNavVC, profileNavVC], animated: true)
        
    }
}
