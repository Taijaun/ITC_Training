//
//  TableVCTests.swift
//  MVVM_AssignmentUITests
//
//  Created by Taijaun Pitt on 20/04/2023.
//

import XCTest

final class TableVCTests: XCTestCase {

    var app : XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        
        let navButton = app.buttons["navButton"]
        navButton.tap()

    }

    override func tearDownWithError() throws {
        app = nil
    }
    

    func testIsTableViewVisible() throws {
        
        let tableView = app.tables.matching(identifier: "myTableView")
        let cell = tableView.element(boundBy: 0).cells.element(boundBy: 0)
        
        XCTAssertTrue(cell.exists)
    }
    
    func testImageViewsVisible() throws {
        
        // Give the imageView an identifier and check if it exists
        let imageView = app.images["secondCellImageView"]
        XCTAssertTrue(imageView.exists)
        
    }
    
    func testNavToDetailsScreen() throws {
        
        let tableView = app.tables.matching(identifier: "myTableView")
        let cell = tableView.element(boundBy: 0).cells.element(boundBy: 0)
        cell.tap()
        
        let titleLabel = app.staticTexts["detailsTitle"]
        XCTAssertTrue(titleLabel.exists)
        
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
