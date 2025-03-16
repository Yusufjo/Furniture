//
//  ProductItem.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

import Foundation

struct ProductItem {
    let id: Int?
    let name: String?
    let price: Double?
    let priceUnit: String?
    let mainImage: String?
    
    static func from(productResponse: ProductResponse) -> ProductItem {
        return ProductItem(
            id: productResponse.id,
            name: productResponse.name,
            price: productResponse.price,
            priceUnit: productResponse.priceUnit,
            mainImage: productResponse.mainImage
        )
    }
}
    
