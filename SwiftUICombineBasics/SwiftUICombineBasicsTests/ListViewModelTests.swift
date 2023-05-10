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
    
    func testSearchWithOneResult() throws {
        
        listViewModel.getPlanetList(apiUrl: "PlanetList")
//        listViewModel.filterPlanets(searchTerm: "Alderaan")
        
        let expectation = XCTestExpectation(description: "This test expects the list to have values when filtered")
        let waitDuration = 10.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            self.listViewModel.filterPlanets(searchTerm: "Alderaan")
            XCTAssertNotNil(self.listViewModel)
            XCTAssertEqual(self.listViewModel.planetsList.count, 10)
            XCTAssertEqual(self.listViewModel.filteredPlanetsList.count, 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
        
    }
    
    func testSearchWithInvalidSearchTerm() throws {
        
        listViewModel.getPlanetList(apiUrl: "PlanetList")
//        listViewModel.filterPlanets(searchTerm: "Alderaan")
        
        let expectation = XCTestExpectation(description: "This test expects the list to have values when filtered")
        let waitDuration = 10.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            self.listViewModel.filterPlanets(searchTerm: "zzzzzzzzzz")
            XCTAssertNotNil(self.listViewModel)
            XCTAssertEqual(self.listViewModel.planetsList.count, 10)
            XCTAssertEqual(self.listViewModel.filteredPlanetsList.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
        
    }
    
    func testSearchWithEmptySearchTerm() throws {
        
        listViewModel.getPlanetList(apiUrl: "PlanetList")
//        listViewModel.filterPlanets(searchTerm: "Alderaan")
        
        let expectation = XCTestExpectation(description: "This test expects the list to be equal to the original list as the search term is empty")
        let waitDuration = 10.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            self.listViewModel.filterPlanets(searchTerm: "")
            XCTAssertNotNil(self.listViewModel)
            XCTAssertNotNil(self.listViewModel.planetsList)
            XCTAssertNotNil(self.listViewModel.filteredPlanetsList)
            XCTAssertEqual(self.listViewModel.planetsList.count, self.listViewModel.filteredPlanetsList.count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
        
    }
    
    //MARK: - Tests for cancel function
    
    func testCancelAPICall() throws {
        
        listViewModel.getPlanetList(apiUrl: "PlanetList")
        listViewModel.cancelApiCall()
        
        let expectation = XCTestExpectation(description: "This test expects the list to be empty")
        let waitDuration = 5.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            XCTAssertNotNil(self.listViewModel)
            XCTAssertEqual(self.listViewModel.planetsList.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
