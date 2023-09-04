//
//  ProductRepositoryProtocol.swift
//  LocalDatabase
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules

public protocol ProductRepositoryProtocol {
    func saveProducts(_ product: [Product], completionBlock: (Result<Void, Error>) -> Void)
    func removeProducts(completionBlock: (Result<Void, Error>) -> Void)
    func getProducts(completionBlock: (Result<[Product], Error>) -> Void)
}
