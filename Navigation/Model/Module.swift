//
//  File.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 6/8/23.
//

import UIKit


protocol ViewModel: AnyObject {
    
}


struct Module {
    
    enum ModuleType {
        case feed
        case login
    }
    
    let moduleType: ModuleType
    let viewModel: ViewModel?
    let view: UIViewController
}


extension Module.ModuleType {
    var tabBarItem: UITabBarItem {
        switch self {
        case .feed:
            return UITabBarItem(title: "Feed", image: UIImage(systemName: "square.and.pencil.circle"), tag: 0)
            
        case .login:
            return UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 0)
        
        }
    }
}
