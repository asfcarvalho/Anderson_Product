//
//  ProductRLM.swift
//  LocalDatabase
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import RealmSwift

@objcMembers
internal class ProductRLM: Object {
    override class func primaryKey() -> String? {
        #keyPath(ProductRLM.productId)
    }
    
    @objc internal dynamic var productId: Int = 0
    internal dynamic var title: String = ""
    internal dynamic var rating: Double = 0.0
}
