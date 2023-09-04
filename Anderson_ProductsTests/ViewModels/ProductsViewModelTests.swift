//
//  ProductsViewModelTests.swift
//  Anderson_ProductsTests
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import XCTest
import Common
@testable import Anderson_Products

final class ProductsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductsViewModel_WhenProductsViewDidLoad_ThenFetchProductsSuccess() {
        // Arrange
        let expectation = expectation(description: "Expected the successfulFetch() method to be called")
        let mockDataSource = MockProductsDataSource()
        let sut = ProductsViewModel(movieDataSource: mockDataSource)
        mockDataSource.expectation = expectation
        mockDataSource.products = LoadJsonData.loadJson(filename: "ProductList")
        
        // Act
        sut.send(action: .viewDidLoad)
        
        // Assert
        self.wait(for: [expectation], timeout: 5)
        
        XCTAssertNotNil(sut.products)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
