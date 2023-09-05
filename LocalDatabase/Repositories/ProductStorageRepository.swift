//
//  ProductStorageRepository.swift
//  LocalDatabase
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation
import DataModules

public final class ProductStorageRepository: BaseStorageRepository, ProductRepositoryProtocol, ProductInfoRepositoryProtocol {
    public func saveProducts(_ product: [Product], completionBlock: (Result<Void, Error>) -> Void) {
        let realm = self.realm
        
        do {
            try realm.write {
                let old = realm.objects(ProductRLM.self)
                realm.delete(old)
                let new = product.asProductRLMArray()
                realm.add(new)
                completionBlock(.success(()))
            }
        } catch {
            completionBlock(.failure(error))
        }
    }
    
    public func removeProducts(completionBlock: (Result<Void, Error>) -> Void) {
        let realm = self.realm
        
        do {
            try realm.write {
                let objects = realm.objects(ProductRLM.self)
                realm.delete(objects)
                completionBlock(.success(()))
            }
        } catch {
            completionBlock(.failure(error))
        }
    }
    
    public func getProducts(completionBlock: (Result<[Product], Error>) -> Void) {
        let realm = self.realm
        let objects = realm.objects(ProductRLM.self)
        
        completionBlock(.success(objects.asProductArray()))
    }
    
    // MARK: - Product Info
    
    public func saveProductInfo(productInfo: ProductInfo, completionBlock: (Result<Void, Error>) -> Void) {
        let realm = self.realm
        
        do {
            try realm.write {
                let old = realm.objects(ProductInfoRLM.self)
                realm.delete(old)
                let new = productInfo.asProductInfoRLM()
                realm.add(new)
                completionBlock(.success(()))
            }
        } catch {
            completionBlock(.failure(error))
        }
    }
    
    public func getProductInfo(completionBlock: (Result<ProductInfo, Error>) -> Void) {
        let realm = self.realm
        guard let objects = realm.objects(ProductInfoRLM.self).first else {
            completionBlock(.failure(MyError.LocalDatabaseError))
            return
        }
        
        completionBlock(.success(objects.asProductInfo()))
    }
}
