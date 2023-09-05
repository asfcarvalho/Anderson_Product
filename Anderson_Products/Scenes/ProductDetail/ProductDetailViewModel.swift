//
//  ProductDetailViewModelViewModel.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 05/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import BaseUI
import DataModules

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product?
    
    var router: ProductDetailRouter?
    
    init(_ product: Product? = nil) {
        self.product = product
    }
    
    public func send(action: ViewModel.ProductDetail.ViewInput.Action) {
        switch action {
        case .dismiss:
            router?.perform(action: .dismiss)
        }
    }
}

public extension ViewModel {
    enum ProductDetail {
        public enum ViewOutput {
            public enum Action: Hashable {
                case dismiss
            }
        }
        
        public enum ViewInput: Hashable {
            public enum Action: Hashable {
                case dismiss
            }
        }
    }
}
