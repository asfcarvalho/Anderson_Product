//
//  ProductsDataSourceTests.swift
//  Anderson_ProductsTests
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import XCTest
import DataModules
import Common

final class ProductsDataSourceTests: XCTestCase {

    var urlSession: URLSession!
    var apiCalling: APICalling!
    var sut: ProductsDataSource!
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        apiCalling = APICalling(urlSession: urlSession)
        sut = ProductsDataSource(apiCalling: apiCalling)
    }

    override func tearDownWithError() throws {
        urlSession = nil
        apiCalling = nil
        sut = nil
    }

    func testProductsDataSource_WhenProductsFetch_ThenResponseSuccess() {
        // Arrange
        let expectation = self.expectation(description: "Fetch Product List Response Expectation")
        
        MockURLProtocol.stubResponseData = LoadJsonData.loadJsonData(filename: "ProductList")
        
        // Act
        sut.fetchProducts(skip: 0) { result in
            // Assert
            switch result {
            case .success(let success):
                XCTAssertNotNil(success)
            case .failure(let failure):
                XCTAssertNil(failure)
            }
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 3)
    }
    
    func testProductsDataSource_WhenProductsFetch_ThenResponseVailure() {
        // Arrange
        let expectation = self.expectation(description: "Fetch Product List Response Expectation")
        
        MockURLProtocol.error = MyError.ErrorDefault
        
        // Act
        sut.fetchProducts(skip: 0) { result in
            // Assert
            switch result {
            case .success(let success):
                XCTAssertNil(success)
            case .failure(let failure):
                XCTAssertNotNil(failure)
            }
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
