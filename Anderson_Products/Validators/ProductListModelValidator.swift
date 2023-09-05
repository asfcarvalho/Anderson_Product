//
//  ProductListModelValidator.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules

public class ProductListModelValidator: ProductListValidatorProtocol {
    public func shuldCallNextPage(_ index: Int, _ productInfo: ProductInfo) -> Bool {
        let maxValue = productInfo.skip + productInfo.limit
        
        return maxValue < productInfo.total && index == maxValue - 5
    }
}
