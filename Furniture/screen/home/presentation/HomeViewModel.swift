//
//  HomeViewModel.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

class HomeViewModel {
    
    private let productsRepository: ProductsRepository
    
    private var _productList: [ProductItem] = [] {
        didSet { onProductListUpdated?(_productList) }
    }
    var productList: [ProductItem] { _productList }
    
    private var _categoryList: [CategoryItem] = [] {
        didSet { onCategoryListUpdated?(_categoryList) }
    }
    var categoryList: [CategoryItem] { _categoryList }
    
    private var _networkState: NetworkState = .idle {
        didSet { onNetworkStateChanged?(_networkState) }
    }
    var networkState: NetworkState { _networkState }
    
    
    var onProductListUpdated: (([ProductItem]) -> Void)?
    var onCategoryListUpdated: (([CategoryItem]) -> Void)?
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
                    self?._productList = productList.compactMap { response in
                        ProductItem.from(productResponse: response)
                    }
                    self?._categoryList = self?.getCategories() ?? []
                case .failure(let error):
                    self?._networkState = .error
            }
        }
    }
    
    private func getCategories() -> [CategoryItem] {
        return [
            CategoryItem(imageName: "stard", selectedImageName: "stars", title: "Popular", isSelected: true),
            CategoryItem(imageName: "chaird", selectedImageName: "chairs", title: "Chair"),
            CategoryItem(imageName: "tabled", selectedImageName: "tables", title: "Table"),
            CategoryItem(imageName: "sofad", selectedImageName: "sofab", title: "Armchair"),
            CategoryItem(imageName: "yatakd", selectedImageName: "yataks", title: "Bed"),
            CategoryItem(imageName: "lambd", selectedImageName: "lambb", title: "Lamp")
        ]
    }
    
    enum NetworkState {
        case idle
        case loading
        case success
        case error
    }
}
