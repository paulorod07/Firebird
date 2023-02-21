//
//  LoginViewController.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    // MARK: - Overrides
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
}
