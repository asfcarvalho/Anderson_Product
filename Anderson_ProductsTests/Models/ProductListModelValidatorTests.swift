//
//  ProductListModelValidatorTests.swift
//  Anderson_ProductsTests
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import XCTest
import DataModules
@testable import Anderson_Products

final class ProductListModelValidatorTests: XCTestCase {
    
    var productList: Products!
    var sut: ProductListValidatorProtocol!

    override func setUpWithError() throws {
        sut = ProductListModelValidator()
    }

    override func tearDownWithError() throws {
        productList = nil
        sut = nil
    }

    func testProductListModelValidator_WhenProductListCheckNextPage_ThenCallNextPage() throws {
        // Arrange
        productList = Products(products: [], total: 10, skip: 0, limit: 5)
        
        
        // Act
        let callNextPage = sut.shuldCallNextPage(productList)
                
        // Assert
        XCTAssertTrue(callNextPage)
    }
    
    func testProductListModelValidator_WhenProductListCheckNextPage_ThenNotCallNextPage() throws {
        // Arrange
        productList = Products(products: [], total: 10, skip: 0, limit: 10)
        
        // Act
        let callNextPage = sut.shuldCallNextPage(productList)
                
        // Assert
        XCTAssertFalse(callNextPage)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
