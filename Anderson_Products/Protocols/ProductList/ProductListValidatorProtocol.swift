//
//  ProductListValidatorProtocol.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules

public protocol ProductListValidatorProtocol {
    func shuldCallNextPage(_ productInfo: ProductInfo) -> Bool
}
