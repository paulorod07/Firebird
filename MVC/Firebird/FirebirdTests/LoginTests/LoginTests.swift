//
//  LoginTests.swift
//  FirebirdTests
//
//  Created by Paulo Rodrigues on 20/02/23.
//

import XCTest
@testable import Firebird

final class LoginTests: XCTestCase {

    func test_login_success() {
        let (_, _, manager) = makeSUT()
        
        var returnedStatus: Result<UserModel, NSError>?
        var returnedValue: UserModel?
        
        let expectation = expectation(description: "Aguardando retorno de registro com sucesso")
        
        manager.login(email: "teste@teste8.com", password: "abc123456") { result in
            
            switch result {
                case .success(let userModel):
                    debugPrint("userModel: \(userModel)")
                    returnedValue = userModel
                    returnedStatus = .success(userModel)
                    expectation.fulfill()
                case .failure(let error):
                    debugPrint("error: \(error.localizedDescription)")
            }
            
        }
        
        wait(for: [expectation], timeout: 20)
        
        XCTAssertNotNil(returnedValue)
        XCTAssertEqual(returnedStatus, .success(try XCTUnwrap(returnedValue)))
    }
    
    func test_login_failure_with_invalid_password() {
        let (_, _, manager) = makeSUT()
        
        var returnedStatus: Result<UserModel, NSError>?
        var returnedValue = ""
        
        let expectation = expectation(description: "Aguardando retorno de registro com senha inválida")
        
        manager.login(email: "teste@teste.com", password: "a") { result in
            
            switch result {
                case .success(let userModel):
                    debugPrint("userModel: \(userModel)")
                case .failure(let error):
                    debugPrint("error: \(error.localizedDescription)")
                    returnedStatus = .failure(self.anyError(errorMessage: error.localizedDescription))
                    returnedValue = error.localizedDescription
                    expectation.fulfill()
            }
            
        }
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(returnedStatus, .failure(anyError(errorMessage: returnedValue)))
    }
    
    func test_login_failure_with_wrong_email() {
        let (_, _, manager) = makeSUT()
        
        var returnedStatus: Result<UserModel, NSError>?
        var returnedValue = ""
        
        let expectation = expectation(description: "Aguardando retorno de registro com com erro no email")
        
        manager.login(email: "teste", password: "abc123456") { result in
            
            switch result {
                case .success(let userModel):
                    debugPrint("userModel: \(userModel)")
                case .failure(let error):
                    debugPrint("error: \(error.localizedDescription)")
                    returnedValue = error.localizedDescription
                    returnedStatus = .failure(self.anyError(errorMessage: error.localizedDescription))
                    expectation.fulfill()
            }
            
        }
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(returnedValue, "The email address is badly formatted.")
        XCTAssertEqual(returnedStatus, .failure(anyError(errorMessage: returnedValue)))
    }
    
    private func makeSUT() -> (
        UserProviderProtocol,
        UserBusinessProtocol,
        UserManagerProtocol) {
            let provider = UserProvider()
            let business = UserBusiness(provider: provider)
            let manager = UserManager(business: business)
            
            return (provider, business, manager)
        }
    
    private func anyError(errorMessage: String) -> NSError {
        NSError(domain: errorMessage, code: -1)
    }

}
