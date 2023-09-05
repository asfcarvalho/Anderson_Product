//
//  Product.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import Common

public struct Product: Hashable {
    public let id: Int
    public let title: String
    public let rating: Double
    public let price: Int
    public let discountPercentage: Double
    public let stock: Int
    public let thumbnail: String
    
    public var ratingString: String {
        String(format: "Rating: %.1f", rating)
    }
    
    public var priceString: String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "us"
        
        return format.string(from: NSNumber(value: price)) ?? ""
    }
    
    public var discount: String {
        String(format: "Discount: %.2f%@", discountPercentage, "%")
    }
    
    public var stockString: String {
        "In Stock: \(stock)"
    }
    
    public var icon: String {
        if rating.roundTo(places: 1) < 3 {
            return "star"
        } else if rating.roundTo(places: 1) >= 3 && rating.roundTo(places: 1) <= 4 {
            return "star.leadinghalf.filled"
        } else {
            return "star.fill"
        }
    }
    
    public init(id: Int, title: String, rating: Double, price: Int, discountPercentage: Double, stock: Int, thumbnail: String) {
        self.id = id
        self.title = title
        self.rating = rating
        self.price = price
        self.discountPercentage = discountPercentage
        self.stock = stock
        self.thumbnail = thumbnail
    }
}
