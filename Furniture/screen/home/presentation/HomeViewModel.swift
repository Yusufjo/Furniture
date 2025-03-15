//
//  HomeViewModel.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

class HomeViewModel {
    
    private let productsRepository: ProductsRepository
    
    private var _productList: [ProductResponse] = [] {
        didSet {
            onProductListUpdated?(_productList)
        }
    }
    var productList: [ProductResponse] { _productList }
    
    private var _networkState: NetworkState = .idle {
        didSet {
            onNetworkStateChanged?(_networkState)
        }
    }
    var networkState: NetworkState { _networkState }
    
    
    var onProductListUpdated: (([ProductResponse]) -> Void)?
    var onNetworkStateChanged: ((NetworkState) -> Void)?
    
    init(productsRepository: ProductsRepository) {
        self.productsRepository = productsRepository
    }
    
    func fetchProducts() {
        _networkState = .loading
        productsRepository.getProducts { [weak self] result in
            switch result {
                case .success(let productList):
                    self?._networkState = .success
                    self?._productList = productList
                case .failure(let error):
                    self?._networkState = .error
            }
        }
    }
    
    enum NetworkState {
        case idle
        case loading
        case success
        case error
    }
}
