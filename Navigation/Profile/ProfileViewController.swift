//
//  ProfileViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/9/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let headerView: ProfileHeaderView =
    {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitle("New button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(newButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4.0
        button.layer.shadowOffset = CGSizeMake(4, 4)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        view.addSubview(headerView)
        view.addSubview(newButton)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220),
            newButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            newButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    @objc func newButtonPressed() {
        
    }
    
    
}

