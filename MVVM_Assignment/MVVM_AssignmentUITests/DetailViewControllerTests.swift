//
//  DetailViewControllerTests.swift
//  MVVM_AssignmentUITests
//
//  Created by Taijaun Pitt on 20/04/2023.
//

import XCTest

final class DetailViewControllerTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        
        let navButton = app.buttons["navButton"]
        navButton.tap()
        
        let tableView = app.tables.matching(identifier: "myTableView")
        let cell = tableView.element(boundBy: 0).cells.element(boundBy: 0)
        cell.tap()

        
    }

    override func tearDownWithError() throws {
        
        app = nil
    }
    
    func testDoesCollectionExist() throws {
        
        
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
