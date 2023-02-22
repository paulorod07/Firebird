//
//  HomeView.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 22/02/23.
//

import Foundation
import UIKit

class HomeView: UIView {

    // MARK: - Properties
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem vindo ao app Firebird (MVVM-C)"
        return label
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
        self.addSubview(helloLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    // MARK: - Actions
    
}

