//
//  ProductDetailRouterRouter.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 05/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import BaseUI
import DataModules

class ProductDetailRouter{
    
    private(set) weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
        
    class func build(_ product: Product?) -> UIHostingController<ProductDetailView> {
        let viewModel = ProductDetailViewModel(product)
        let rootView = ProductDetailView(input: viewModel)
        let viewController = ProductDetailViewController(rootView: rootView)
        viewModel.router = ProductDetailRouter(viewController: viewController)
        
        return viewController
    }
    
    func perform(action: Router.ProductDetailRouter.ViewOutput.Acion) {
        switch action {
        case .sample:
            break
        case .dismiss:
            viewController?.dismiss(animated: true)
        }
    }
}

public extension Router {
    enum ProductDetailRouter {
        public enum ViewOutput {
            public enum Acion: Hashable {
                case sample
                case dismiss
            }
        }
    }
}
