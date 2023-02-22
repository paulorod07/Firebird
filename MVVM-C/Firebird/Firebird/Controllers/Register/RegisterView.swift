//
//  RegisterView.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit


class RegisterView: UIView {
    
    // MARK: - Closures
    var onRegisterButtonTapped: ((_ email: String, _ password: String) -> Void)?
    var onPasswordConfirmInvalid: (() -> Void)?
    
    // MARK: - Properties
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.setLeftPaddingPoints(14)
        
        textField.backgroundColor = .lightGray
        textField.textColor = .darkGray
        
        textField.placeholder = "Digite seu E-mail:"
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.setLeftPaddingPoints(14)
        
        textField.backgroundColor = .lightGray
        textField.textColor = .darkGray
        
        textField.placeholder = "Digite sua senha:"
        
        return textField
    }()
    
    lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirme a senha"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.setLeftPaddingPoints(14)
        
        textField.backgroundColor = .lightGray
        textField.textColor = .darkGray
        
        textField.placeholder = "Digite sua senha:"
        
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .viewBackgroundColor
        setElements()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Elements
    func setElements() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(confirmPasswordLabel)
        self.addSubview(confirmPasswordTextField)
        self.addSubview(registerButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // MARK: - Actions
    @objc
    func registerButtonTapped() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text,
            password == confirmPassword
        else {
            self.onPasswordConfirmInvalid?()
            return
        }
        
        self.onRegisterButtonTapped?(email, password)
    }
    
}
