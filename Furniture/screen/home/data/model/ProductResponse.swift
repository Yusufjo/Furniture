//
//  ProductResponse.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//


struct ProductResponse: Codable {
    let id: Int?
    let name: String?
    let price: Double?
    let priceUnit: String?
    let mainImage: String?
}