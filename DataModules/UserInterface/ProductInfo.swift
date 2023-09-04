//
//  ProductInfo.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation

public struct ProductInfo {
    public let total: Int
    public let skip: Int
    public let limit: Int
    
    public init(total: Int, skip: Int, limit: Int) {
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}
