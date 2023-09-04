//
//  ProductInfo+Mapper.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation

public extension Products {
    func asProductInfo() -> ProductInfo {
        ProductInfo(total: total ?? 100,
                    skip: skip ?? 0,
                    limit: limit ?? 10)
    }
}
