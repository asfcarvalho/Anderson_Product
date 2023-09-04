//
//  ProductListModelValidator.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules

public class ProductListModelValidator: ProductListValidatorProtocol {
    public func shuldCallNextPage(_ productInfo: ProductInfo) -> Bool {
        productInfo.skip + productInfo.limit < productInfo.total
    }
}
