//
//  TableViewModelTests.swift
//  MVVM_AssignmentTests
//
//  Created by Taijaun Pitt on 20/04/2023.
//

import XCTest
@testable import MVVM_Assignment

final class TableViewModelTests: XCTestCase {
    
    var tableViewModel: TableViewModel!
    
    

    override func setUpWithError() throws {
        
        tableViewModel = TableViewModel(manager: FakeManager())
        
    }

    override func tearDownWithError() throws {
        tableViewModel = nil
    }
    
    func testApiCallFromMockData() throws {
        tableViewModel.getDataWithClosure(urlString: "Hello")
        
        let duration: Double = 5
        let expectation = expectation(description: "Fetching list of all Products")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            
            XCTAssertEqual(self.tableViewModel.productList.count, 1)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
        
        
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
