//
//  LogInViewController.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 4/1/23.
//

import UIKit

class LogInViewController: UIViewController {

    var logoImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named:"blue_pixel"), for: .normal)
        button.setBackgroundImage(UIImage(named:"blue_pixel")?.image(alpha: 0.8), for: .selected)
        button.setBackgroundImage(UIImage(named:"blue_pixel")?.image(alpha: 0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named:"blue_pixel")?.image(alpha: 0.8), for: .disabled)
        button.imageView?.layer.cornerRadius = 10
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(self.logInTextField)
        stack.addArrangedSubview(self.passwordTextField)
        stack.layer.cornerRadius = 10
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = UIColor.systemGray6
        return stack
    }()
    
    
    lazy var logInTextField: UITextField = {
        let tField = UITextField(frame: .zero)
        tField.placeholder = "Email or phone"
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
        tField.delegate = self
        return tField
    }()
    
    
    lazy var passwordTextField: UITextField = {
        let tField = UITextField(frame: .zero)
        tField.placeholder = "Password"
        tField.setLeftPaddingPoints(10)
        tField.textColor = .black
        tField.font = UIFont.systemFont(ofSize: 16)
        tField.layer.cornerRadius = 10
        tField.autocapitalizationType = .none
        tField.backgroundColor = UIColor.systemGray6
        tField.tintColor = UIColor(named: "AccentColor")
        tField.isSecureTextEntry = true
        tField.keyboardType = UIKeyboardType.default
        tField.returnKeyType = UIReturnKeyType.done
        tField.translatesAutoresizingMaskIntoConstraints = false
        tField.delegate = self
        return tField
    }()
    
    
   lazy var scrollContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var logInScrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        logInTextField.becomeFirstResponder()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        if logInScrollView.contentInset.bottom == 0 {
            logInScrollView.contentInset.bottom += keyboardHeight ?? 0.0
        }
       // logInScrollView.scrollIndicatorInsets.bottom += keyboardHeight ?? 0.0
        
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        logInScrollView.contentInset.bottom = 0.0
      //  logInScrollView.scrollIndicatorInsets.bottom = 0.0
    }

    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        view.addSubview(logInScrollView)
        logInScrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(logoImageView)
        scrollContentView.addSubview(stackView)
        scrollContentView.addSubview(logInButton)
        scrollContentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            logInScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logInScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logInScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logInScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: logInScrollView.topAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: logInScrollView.widthAnchor),
            scrollContentView.heightAnchor.constraint(equalTo: logInScrollView.heightAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: logInScrollView.bottomAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: logInScrollView.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: logInScrollView.trailingAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: scrollContentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -16),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -16),
            
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }

    @objc func goToProfile() {
        let pvc = ProfileViewController()
        navigationController?.navigationBar.isHidden = false
        self.show(pvc, sender: self)
    }
    
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
