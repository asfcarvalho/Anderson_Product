//
//  ProductDetailViewControllerViewController.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 05/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
import DataModules

class ProductDetailViewController: UIHostingController<ProductDetailView> {
    
    private var token = CancelBag()
    private var viewModel: ProductDetailViewModel?
    
    override init(rootView: ProductDetailView) {
        super.init(rootView: rootView)
        
        viewModel = rootView.input
        configureComunication()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureComunication() {
        rootView.output.value.sink { [weak self] action in
            guard let self = self else { return }
            switch action {
            case .dismiss:
                self.viewModel?.send(action: .dismiss)
            }
        }.store(in: token)
    }
}
