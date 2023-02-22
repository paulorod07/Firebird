//
//  HomeViewController.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    lazy var homeView: HomeView = {
        let view = HomeView()
        return view
    }()
    
    // MARK: - Overrides
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
