//
//  FeedViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/4/23.
//

import UIKit

class FeedViewController: UIViewController {

    var firstPost = Post(title: "Hello world!")
    
    var postButton: UIButton = {
        var button = UIButton()
        button.setTitle("New Post", for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.yellow.cgColor
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 45)
        button.addTarget(self, action: #selector(getNewPost), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your feed"
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        postButton.center = view.center
        view.addSubview(postButton)
    }
    
    
    @objc func getNewPost() {
        let postVC = PostViewController()
        postVC.title = firstPost.title
        self.show(postVC,sender: self)
    }

}
