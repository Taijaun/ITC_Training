//
//  LoginScreenTests.swift
//  assignment_9UITests
//
//  Created by Taijaun Pitt on 18/04/2023.
//

import XCTest

final class LoginViewControllerTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        app = nil
        
    }
    
    func testLoginButtonExists() throws {
        let loginButton = app.buttons["Button"]
        XCTAssertTrue(loginButton.exists)
        
    }
    
    func testEmailTextFieldExists() throws {
        let emailTextField = app.textFields["E-mail"]
        emailTextField.tap()
        emailTextField.typeText("Hello@gmail.com")
        XCTAssertTrue(emailTextField.exists)
    }
    
    func testPasswordFieldExists() throws {
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678")
        XCTAssertTrue(passwordTextField.exists)
    }
    
    func testLoginFlowValid() throws {
        
        let emailTextField = app.textFields["E-mail"]
        emailTextField.tap()
        emailTextField.typeText("Hello@gmail.com")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678")
        
        let loginButton = app.buttons["Button"]
        loginButton.tap()
        
        let showDetailsButton = app.buttons["Show details"]
        XCTAssertTrue(showDetailsButton.exists)
        
        
    }
    
    func testDetailFlowValid() throws {
        
        let emailTextField = app.textFields["E-mail"]
        emailTextField.tap()
        emailTextField.typeText("Hello@gmail.com")

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678")

        let loginButton = app.buttons["Button"]
        loginButton.tap()
        
        let showDetailsButton = app.buttons["Show details"].firstMatch
        showDetailsButton.tap()
        
        let persimmonLabel = app.staticTexts["Persimmon"]
        XCTAssertTrue(persimmonLabel.exists)
    }

    func testExample() throws {
        

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
