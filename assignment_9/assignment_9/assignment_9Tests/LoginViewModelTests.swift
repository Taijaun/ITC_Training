//
//  LoginViewModelTests.swift
//  assignment_9Tests
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import XCTest
@testable import assignment_9

final class LoginViewModelTests: XCTestCase {
    
    var loginViewModel : LoginViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginViewModel = nil
    }
    
    // Should be true
    func testIsLoginValid() {
        
        let result = loginViewModel.isLoginValid(email: "Hello@hello.com", password: "12345678")
        XCTAssertTrue(result)
    }
    
    func testIsLoginValid_With_Invalid_Email() {
        
        let result = loginViewModel.isLoginValid(email: "Hellohello.com", password: "12345678")
        XCTAssertFalse(result)
    }
    
    func testIsLoginValid_With_Invalid_Password() {
        
        let result = loginViewModel.isLoginValid(email: "Hello@hello.com", password: "12345")
        XCTAssertFalse(result)
    }
    
    func testIsLoginValid_With_Both_Invalid() {
        
        let result = loginViewModel.isLoginValid(email: "Hello world", password: "yes")
        XCTAssertFalse(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
