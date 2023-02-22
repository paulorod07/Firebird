//
//  RegisterCoordinator.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class RegisterCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onRegisterSuccess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
}
