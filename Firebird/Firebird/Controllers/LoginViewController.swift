//
//  LoginViewController.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "teste@teste99.com"
        passwordTextField.text = "abc123456"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let provider = UserProvider()
        let business = UserBusiness(provider: provider)
        let manager = UserManager(business: business)
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            manager.login(email: email, password: password) { result in
                
                switch result {
                    case .success:
                        self.routeToHome()
                    case .failure(let error):
                        self.showMessage(title: "Error", message: error.localizedDescription)
                }
                
            }
            
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    func routeToHome() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        homeVC?.modalPresentationStyle = .fullScreen
        
        self.present(homeVC ?? UIViewController(), animated: true)
    }
    
}
