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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            
            if password != confirmPassword {
                showMessage(title: "Atenção", message: "senha está diferente da confirmação de senha")
                return
            }
            
            let provider = UserProvider()
            let business = UserBusiness(provider: provider)
            let manager = UserManager(business: business)
            
            manager.register(email: email, password: password) { result in
                 
                switch result {
                    case .success:
                        self.routeToHome()
                    case .failure(let error):
                        self.showMessage(title: "Error", message: error.localizedDescription)
                }
                
            }
            
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        routeToLogin()
    }
    
    func routeToLogin() {
        dismiss(animated: true)
    }
    
    func routeToHome() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        homeVC?.modalPresentationStyle = .fullScreen
        
        present(homeVC ?? UIViewController(), animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
}
