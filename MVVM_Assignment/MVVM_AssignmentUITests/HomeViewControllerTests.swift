//
//  HomeViewControllerTests.swift
//  MVVM_AssignmentUITests
//
//  Created by Taijaun Pitt on 20/04/2023.
//

import XCTest

final class HomeViewControllerTests: XCTestCase {
    
    var app : XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testNavExists() throws {
        
        let navButton = app.buttons["navButton"]
        XCTAssertTrue(navButton.exists)
        
        
        
    }
    
    func testNavToTableFlow() throws {
        
        let navButton = app.buttons["navButton"]
        navButton.tap()
        
        let tableCell = app.tables.matching(identifier: "myTableView")
        let cell = tableCell.element(boundBy: 0).cells.element(boundBy: 0)
        
        XCTAssertTrue(cell.exists)
        
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
