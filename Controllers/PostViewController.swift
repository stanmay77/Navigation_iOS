//
//  PostViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/4/23.
//

import UIKit

class PostViewController: UIViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(goBar))
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func goBar() {
        present(InfoViewController(), animated: true)
    }
    
}
