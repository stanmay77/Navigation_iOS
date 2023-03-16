//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 3/9/23.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private var statusText: String?
    
    let statusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4.0
        button.layer.shadowOffset = CGSizeMake(4, 4)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nickNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cat"))
        
        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField(frame: CGRect(x:10, y:10, width: 100, height: 35))
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.setLeftPaddingPoints(10)
        textField.text = "Enter status..."
        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.addSubview(statusButton)
        self.addSubview(nickNameLabel)
        self.addSubview(imageView)
        self.addSubview(statusLabel)
        self.addSubview(textField)
        

        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            nickNameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 40),
            nickNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -50),
            statusLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            textField.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 40),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    
    }
    
    @objc func buttonPressed() {
        // For task 1: print(statusLabel.text ?? "Status not set")
        // For task 2:
        statusLabel.text = self.statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = textField.text ?? ""
    }
    
    
}
