//
//  Product+Mapper.swift
//  LocalDatabase
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules

internal extension Product {
    func asProductRLM() -> ProductRLM {
        ProductRLM.create { object in
            object.productId = id
            object.title = title
            object.rating = rating
        }
    }
}

internal extension Sequence where Element == Product {
    func asProductRLMArray() -> [ProductRLM] {
        self.map { $0.asProductRLM() }
    }
}

internal extension ProductRLM {
    func asProduct() -> Product {
        Product(id: productId,
                title: title,
                rating: rating)
    }
}

internal extension Sequence where Element == ProductRLM {
    func asProductArray() -> [Product] {
        self.map { $0.asProduct() }
    }
}

internal extension ProductInfo {
    func asProductInfoRLM() -> ProductInfoRLM {
        ProductInfoRLM.create { object in
            object.total = total
            object.skip = skip
            object.limit = limit
        }
    }
}

internal extension ProductInfoRLM {
    func asProductInfo() -> ProductInfo {
        ProductInfo(total: total,
                    skip: skip,
                    limit: limit)
    }
}
