//
//  ProductInfoRLM.swift
//  LocalDatabase
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import RealmSwift

@objcMembers
internal class ProductInfoRLM: Object {
    override class func primaryKey() -> String? {
        #keyPath(ProductInfoRLM.total)
    }
    
    @objc internal dynamic var total: Int = 0
    internal dynamic var skip: Int = 0
    internal dynamic var limit: Int = 0
    
    init(total: Int, skip: Int, limit: Int) {
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}
