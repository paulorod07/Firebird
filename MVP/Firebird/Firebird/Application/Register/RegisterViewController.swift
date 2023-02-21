//
//  RegisterViewController.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let presenter = RegisterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text,
           password == confirmPassword {
            
            let userModel = UserModel(email: email, password: password)
            presenter.register(userModel: userModel)
            
        } else {
            showMessage(title: "Error", message: "Senhas não conferem")
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        routeToLogin()
    }
    
    func routeToLogin() {
        dismiss(animated: true)
    }
    
}

extension RegisterViewController: RegisterPresenterDelegate {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    func routeToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        homeVC?.modalPresentationStyle = .fullScreen
        
        present(homeVC ?? UIViewController(), animated: true)
    }
    
    
}
