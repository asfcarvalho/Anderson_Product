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

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var productInfo: ProductInfo?
    
    var dataSource: ProductsDataSourceProtocol!
    var validator: ProductListValidatorProtocol!
    
    var router: ProductsRouter?
    
    init(_ products: [Product] = [],
         _ productInfo: ProductInfo? = nil,
         validator: ProductListValidatorProtocol,
         dataSource: ProductsDataSourceProtocol) {
        self.products = products
        self.productInfo = productInfo
        self.validator = validator
        self.dataSource = dataSource
    }
    
    public func send(action: ViewModel.Products.ViewInput.Action) {
        switch action {
        case .dismiss:
            router?.perform(action: .dismiss)
        case .viewDidLoad:
            fetchProducts()
        case .shuldCallNextPage:
            guard let productInfo = productInfo else {
                fetchProducts()
                return
            }
            if validator.shuldCallNextPage(productInfo) {
                fetchProducts(productInfo.skip + productInfo.limit)
            }
        }
    }
    
    private func fetchProducts(_ skip: Int = 0) {
        dataSource.fetchProducts(urlString: nil, skip: skip) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.products = success.products?.asProductArray() ?? []
                    self.productInfo = success.asProductInfo()
                }
            case .failure(let failure):
                debugPrint(failure)
                DispatchQueue.main.async {
                    self.products = []
                }
            }
        }
    }
}

public extension ViewModel {
    enum Products {
        public enum ViewOutput {
            public enum Action: Hashable {
                case sample
                case dismiss
            }
        }
        
        public enum ViewInput: Hashable {
            public enum Action: Hashable {
                case dismiss
                case viewDidLoad
                case shuldCallNextPage
            }
        }
    }
}
