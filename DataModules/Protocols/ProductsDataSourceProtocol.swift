//
//  ProductsDataSourceProtocol.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation

public protocol ProductsDataSourceProtocol {
    func fetchProducts(urlString: String?, skip: Int, callBack: @escaping (Result<Products, MyError>) -> Void)
}
