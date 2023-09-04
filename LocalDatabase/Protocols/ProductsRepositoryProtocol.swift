//
//  ProductsRepositoryProtocol.swift
//  LocalDatabase
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules

public protocol ProductsRepositoryProtocol {
    func saveProductInfo(productInfo: ProductInfo, completionBlock: (Result<Void, Error>) -> Void)
    func getProductInfo(completionBlock: (Result<ProductInfo, Error>) -> Void)
}
