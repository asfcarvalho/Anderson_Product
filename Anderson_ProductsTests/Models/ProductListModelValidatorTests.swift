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
    
    var productInfo: ProductInfo!
    var sut: ProductListValidatorProtocol!

    override func setUpWithError() throws {
        sut = ProductListModelValidator()
    }

    override func tearDownWithError() throws {
        productInfo = nil
        sut = nil
    }

    func testProductListModelValidator_WhenProductListCheckNextPage_ThenCallNextPage() throws {
        // Arrange
        productInfo = ProductInfo(total: 10, skip: 0, limit: 5)
        
        
        // Act
        let callNextPage = sut.shuldCallNextPage(0, productInfo)
                
        // Assert
        XCTAssertTrue(callNextPage)
    }
    
    func testProductListModelValidator_WhenProductListCheckNextPage_ThenNotCallNextPage() throws {
        // Arrange
        productInfo = ProductInfo(total: 10, skip: 0, limit: 10)
        
        // Act
        let callNextPage = sut.shuldCallNextPage(5, productInfo)
                
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
