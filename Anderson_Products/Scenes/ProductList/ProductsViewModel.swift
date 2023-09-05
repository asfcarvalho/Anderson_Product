//
//  ProductsViewModelViewModel.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 04/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import BaseUI
import DataModules
import LocalDatabase

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = true
    private var productInfo: ProductInfo?
    
    var dataSource: ProductsDataSourceProtocol!
    var validator: ProductListValidatorProtocol!
    var localData: ProductRepositoryProtocol & ProductInfoRepositoryProtocol
    
    var router: ProductsRouter?
    
    init(_ products: [Product] = [],
         _ productInfo: ProductInfo? = nil,
         validator: ProductListValidatorProtocol,
         dataSource: ProductsDataSourceProtocol,
         localData: ProductRepositoryProtocol & ProductInfoRepositoryProtocol) {
        self.products = products
        self.productInfo = productInfo
        self.validator = validator
        self.dataSource = dataSource
        self.localData = localData
    }
    
    public func send(action: ViewModel.Products.ViewInput.Action) {
        switch action {
        case .dismiss:
            router?.perform(action: .dismiss)
        case .viewDidLoad:
            fetchLocalProductInfo()
        case .shuldCallNextPage(let index):
            guard let productInfo = productInfo else {
                fetchProducts()
                return
            }
            
            if validator.shuldCallNextPage(index, productInfo) {
                fetchProducts(productInfo.skip + productInfo.limit)
            }
            
        case .showDetail(let product):
            router?.perform(action: .showDetail(product))
        }
    }
    
    private func fetchProducts(_ skip: Int = 0) {
        self.isLoading = true
        dataSource.fetchProducts(urlString: nil, skip: skip) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.products += success.products?.asProductArray() ?? []
                    self.productInfo = success.asProductInfo()
                    self.saveLocalProduct()
                }
            case .failure(let failure):
                debugPrint(failure)
                DispatchQueue.main.async {
                    self.products = []
                }
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
    private func saveLocalProduct() {
        localData.saveProducts(self.products) { _ in }
        if let productInfo = self.productInfo {
            localData.saveProductInfo(productInfo: productInfo) { _ in }
        }
    }
    
    private func fetchLocalProductInfo() {
        localData.getProductInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let productInfo):
                self.productInfo = productInfo
                self.fetchLocalProduct()
            case .failure:
                fetchProducts()
            }
            self.isLoading = false
        }
    }
    
    private func fetchLocalProduct() {
        localData.getProducts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.products = success
                }
            case .failure:
                fetchProducts()
            }
        }
    }
}

public extension ViewModel {
    enum Products {
        public enum ViewOutput {
            public enum Action: Hashable {
                case shuldCallNextPage(_ index: Int)
                case dismiss
                case showDetail(_ product: Product)
            }
        }
        
        public enum ViewInput: Hashable {
            public enum Action: Hashable {
                case dismiss
                case viewDidLoad
                case shuldCallNextPage(_ index: Int)
                case showDetail(_ product: Product)
            }
        }
    }
}
