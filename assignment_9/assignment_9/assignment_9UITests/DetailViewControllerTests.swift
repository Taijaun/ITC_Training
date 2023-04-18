//
//  DetailViewControllerTests.swift
//  assignment_9UITests
//
//  Created by Taijaun Pitt on 18/04/2023.
//

import XCTest

final class DetailViewControllerTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        
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

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testFamilyLabelExists() throws {


        let familyLabel = app.staticTexts["FamilyLabel"]
        XCTAssertTrue(familyLabel.exists)
    }
    
    func testOrderLabelExists() throws {

        let orderLabel = app.staticTexts["OrderLabel"]
        XCTAssertTrue(orderLabel.exists)
        
    }
    
    func testGenusLabelExists() throws {

        let genusLabel = app.staticTexts["GenusLabel"]
        XCTAssertTrue(genusLabel.exists)
        
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
