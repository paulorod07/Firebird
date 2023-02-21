//
//  UserModel.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 19/02/23.
//

import Foundation

struct UserModel: Codable, Equatable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
