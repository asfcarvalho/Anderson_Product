//
//  Product+Mapper.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation

public extension ProductItem {
    func asProduct() -> Product {
        Product(id: self.id ?? 0,
                title: self.title ?? "",
                rating: self.rating ?? 0)
    }
}

public extension Sequence where Element == ProductItem {
    func asProductArray() -> [Product] {
        self.map { $0.asProduct() }
    }
}
