//
//  ListViewModelTests.swift
//  SwiftUICombineBasicsTests
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import XCTest
@testable import SwiftUICombineBasics

final class ListViewModelTests: XCTestCase {
    
    var listViewModel: ListViewModel!

    override func setUpWithError() throws {
        listViewModel = ListViewModel(manager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        listViewModel = nil
    }
    
    //MARK: - Tests for api call and retrieving the data

    func testApiCallWithValidJSON() throws {
        
        listViewModel.getPlanetList(apiUrl: "PlanetList")
        
        let expectation = XCTestExpectation(description: "This test expects that the api is called and data is parsed correctly")
        let waitDuration = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            XCTAssertNotNil(self.listViewModel)
            XCTAssertEqual(self.listViewModel.filteredPlanetsList.count, 10)
            XCTAssertNil(self.listViewModel.customError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
    }
    
    
    func testApiCallWithEmptyJSON() throws {
        
        listViewModel.getPlanetList(apiUrl: "PlanetListEmpty")
        
        let expectation = XCTestExpectation(description: "This test expects that the url is valid but there is no data")
        let waitDuration = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            XCTAssertNotNil(self.listViewModel)
            XCTAssertEqual(self.listViewModel.filteredPlanetsList.count, 0)
            XCTAssertEqual(self.listViewModel.customError, NetworkError.dataNotFound)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
        
    }
    
    //MARK: - Tests for the filtering function
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
