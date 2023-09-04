//
//  Products.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation

public struct Products: Codable {
    public let products: [ProductItem]?
    public let total, skip, limit: Int?
    
    public init(products: [ProductItem]?, total: Int?, skip: Int?, limit: Int?) {
        self.products = products
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}
