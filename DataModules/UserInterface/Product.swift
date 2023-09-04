//
//  Product.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation

public struct Product: Hashable {
    public let id: Int
    public let title: String
    public let rating: Double
    public var ratingString: String {
        String(format: "Rating: %.1f", rating)
    }
    public var icon: String {
        if rating < 3 {
            return "star"
        } else if rating >= 3 && rating <= 4 {
            return "star.leadinghalf.filled"
        } else {
            return "star.fill"
        }
    }
    
    public init(id: Int, title: String, rating: Double) {
        self.id = id
        self.title = title
        self.rating = rating
    }
}
