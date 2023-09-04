//
//  MockProductsDataSource.swift
//  Anderson_ProductsTests
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules
import XCTest

class MockProductsDataSource: ProductsDataSourceProtocol {
    
    var products: Products?
    var error: MyError?
    var expectation: XCTestExpectation?
    
    func fetchProducts(urlString: String?, skip: Int, callBack: @escaping (Result<Products, MyError>) -> Void) {
        if let products = products {
            callBack(.success(products))
        } else if let error = error {
            callBack(.failure(error))
        } else {
            callBack(.failure(.ErrorDefault))
        }
        
        expectation?.fulfill()
    }
}
