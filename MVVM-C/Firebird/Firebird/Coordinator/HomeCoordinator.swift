//
//  HomeCoordinator.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class HomeCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    func start() {
        let viewController = HomeViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}
