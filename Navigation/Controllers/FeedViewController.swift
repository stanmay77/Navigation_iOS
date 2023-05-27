//
//  FeedViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/4/23.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {

    var firstPost = Post(title: "Hello world!", author: "", description: "", image: "", likes: 0, views: 0)
    
    lazy var inputField: UITextField = {
        let tField = UITextField(frame: .zero)
        tField.text = "Insert secret word"
        tField.placeholder = "Email or user name"
        tField.setLeftPaddingPoints(10)
        tField.textColor = .black
        tField.font = UIFont.systemFont(ofSize: 16)
        tField.layer.cornerRadius = 10
        tField.autocapitalizationType = .none
        tField.backgroundColor = UIColor.systemGray6
        tField.keyboardType = UIKeyboardType.default
        tField.returnKeyType = UIReturnKeyType.done
        tField.tintColor = UIColor(named: "AccentColor")
        tField.translatesAutoresizingMaskIntoConstraints = false
        return tField
    }()
    
    
    lazy var resultLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.blue
            .cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 10
        label.text = "Check result"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    lazy var checkGuessButton = CustomButton(frame: .zero, title: "Check", titleColor: .white, bgImage: UIImage(named:"blue_pixel"), cornerRadius: 10)
    
    
    let feedModel: FeedModelProtocol
    
    init(model: FeedModelProtocol) {
        self.feedModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your feed"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI()
        
        checkGuessButton.tapClosure = { [unowned self] in
            
            if let text = inputField.text, text != ""
            {
                if feedModel.check(word: text) {
                    resultLabel.text = "Correct secret word!"
                    resultLabel.backgroundColor = .green
                } else {
                    resultLabel.text = "Wrong secret word!"
                    resultLabel.backgroundColor = .red
                }
            }
            
        }
        
    }
    
    func configureUI() {
        
        view.addSubview(inputField)
        view.addSubview(checkGuessButton)
        view.addSubview(resultLabel)
        
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            
            inputField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputField.widthAnchor.constraint(equalToConstant: 250),
            inputField.heightAnchor.constraint(equalToConstant: 75),
            
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            checkGuessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            checkGuessButton.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: 50),
            
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            resultLabel.heightAnchor.constraint(equalToConstant: 30)
           
        ])
    }
    
}
