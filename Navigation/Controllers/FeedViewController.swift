//
//  FeedViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/4/23.
//

import UIKit

class FeedViewController: UIViewController {

    var firstPost = Post(title: "Hello world!", author: "", description: "", image: "", likes: 0, views: 0)
    
    var postButtonOne: UIButton = {
        var button = UIButton()
        button.setTitle("New Post", for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.yellow.cgColor
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 45)
        button.addTarget(self, action: #selector(getNewPost), for: .touchUpInside)
        return button
    }()
    
    var postButtonTwo: UIButton = {
        var button = UIButton()
        button.setTitle("New Post", for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.yellow.cgColor
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 45)
        button.addTarget(self, action: #selector(getNewPost), for: .touchUpInside)
        return button
    }()
    
    lazy var myStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(self.postButtonOne)
        stack.addArrangedSubview(self.postButtonTwo)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your feed"
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(myStackView)
        
        NSLayoutConstraint.activate([
            myStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myStackView.heightAnchor.constraint(equalToConstant: view.frame.size.height/2),
            myStackView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2)
        ])
        
    }
    
    
    @objc func getNewPost() {
        let postVC = PostViewController()
        postVC.title = firstPost.title
        self.show(postVC,sender: self)
    }

}
