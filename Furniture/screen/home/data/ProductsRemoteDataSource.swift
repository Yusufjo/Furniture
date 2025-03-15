//
//  ProductsRemoteDataSource.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

import Alamofire

class ProductsRemoteDataSource {
    
    func getProducts(completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        let url = "https://furniture-shopping-spring.onrender.com/api/products"
        AF.request(url).responseDecodable(of: [ProductResponse].self) { response in
            switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
