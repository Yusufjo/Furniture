//
//  ProductsRepository.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

import Foundation

class ProductsRepository {
    private let productsRemoteDataSource: ProductsRemoteDataSource
    
    init(productsRemoteDataSource: ProductsRemoteDataSource) {
        self.productsRemoteDataSource = productsRemoteDataSource
    }
    
    func getProducts(completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        productsRemoteDataSource.getProducts(completion: completion)
    }
    
}
