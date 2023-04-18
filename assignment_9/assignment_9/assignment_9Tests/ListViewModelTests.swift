//
//  ListViewModelTests.swift
//  assignment_9Tests
//
//  Created by Taijaun Pitt on 17/04/2023.
//

import XCTest
@testable import assignment_9

final class ListViewModelTests: XCTestCase {
    
    var tableViewModel: TableViewModel!
    var mockViewModel: TableViewModel!
    var stubbingViewModel: TableViewModel!
    
    

    override func setUpWithError() throws {
        // Add the different models with different network managers
        // Instead of doing it in the test func
        
    }

    override func tearDownWithError() throws {
        tableViewModel = nil
    }
    
    

    // MARK: - Faking
    
    func testApiCallWithClosure() {
        tableViewModel = TableViewModel(manager: FakeNetworkManager())
        
        tableViewModel.getDataWithClosure(urlString: "fruits")
        
        let duration: Double = 3.0
        let expectation = expectation(description: "Fetching list of all fruits")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            
            XCTAssertEqual(self.tableViewModel.fruitList.count, 40)
            let fruit = self.tableViewModel.fruitList[0]
            XCTAssertEqual(fruit.name, "Persimmon")
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
    }
    
    // MARK: - Mocking
    
    func testApiCallWithMockData() {
        
        tableViewModel = TableViewModel(manager: FakeNetworkManagerMocking())
        
        tableViewModel.getDataWithClosure(urlString: "fruits")
        
        let duration: Double = 3.0
        let expectation = expectation(description: "Fetching list of all fruits")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            
            XCTAssertEqual(self.tableViewModel.fruitList.count, 2)
            let fruit = self.tableViewModel.fruitList[0]
            XCTAssertEqual(fruit.name, "Apple")
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
        
    }
    
    //MARK: - Stubbing
    
    func testApiCallDataWithStubbing() {
        
        // Set the stubbing data
        let resultArr = [Fruit(genus: "abc", name: "Apple", id: 1, family: "Apple Family", order: "Apple Order", nutritions: (Nutritions(carbohydrates: 1.0, protein: 5.0, fat: 4.0, calories: 2, sugar: 3.0))), Fruit(genus: "cba", name: "Pear", id: 2, family: "Pear Family", order: "Pear Order", nutritions: (Nutritions(carbohydrates: 2.0, protein: 3.0, fat: 4.0, calories: 5, sugar: 6.0)))]
        
        // instantiate the network manager class and set the array
        let fakeNetworkManagerStubbing = FakeNetworkManagerStubbing()
        fakeNetworkManagerStubbing.resultArr = resultArr
        
        tableViewModel = TableViewModel(manager: fakeNetworkManagerStubbing)
        tableViewModel.getDataWithClosure(urlString: "fruits")
        
        let duration: Double = 3.0
        let expectation = expectation(description: "Fetching list of all fruits")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            
            XCTAssertEqual(self.tableViewModel.fruitList.count, 2)
            let fruit = self.tableViewModel.fruitList[0]
            XCTAssertEqual(fruit.name, "Apple")
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
        
    }


    

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
