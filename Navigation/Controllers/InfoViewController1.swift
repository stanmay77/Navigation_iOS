////
////  InfoViewController.swift
////  Navigation
////
////  Created by STANISLAV MAYBORODA on 3/7/23.
////
//
//import UIKit
//
//class InfoViewController: UIViewController {
//
//    let alertButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Get alert", for: .normal)
//        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
//        button.backgroundColor = .systemIndigo
//        button.layer.cornerRadius = 12
//        button.layer.borderColor = UIColor.yellow.cgColor
//        button.frame = CGRect(x: 0, y: 0, width: 220, height: 45)
//        return button
//        
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemTeal
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view.addSubview(alertButton)
//        alertButton.center = view.center
//    }
//    
//    @objc func showAlert() {
//        let alertController = UIAlertController(title: "Alert", message: "Alert received", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "First action", style: .default)
//                                  {_ in
//                                    print("First action!")
//        })
//        alertController.addAction(UIAlertAction(title: "Second action", style: .default)
//                                  {_ in
//                                    print("Second action!")
//        })
//        present(alertController, animated: true)
//                                        
//        
//    }
//    
//
//}
