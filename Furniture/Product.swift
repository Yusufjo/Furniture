//
//  Product.swift
//  Furniture
//
//  Created by yusuf Şentürk on 5.03.2025.
//

import Foundation
import UIKit

struct Product {
    let image: String
    let selectedImage: String
    let title: String
    
}

var categories: [Product] = [
    Product(image: "stard", selectedImage: "stars", title: "Popular"),
    Product(image: "chaird", selectedImage: "chairs", title: "Chair"),
    Product(image: "tabled", selectedImage: "tables", title: "Table"),
    Product(image: "sofad", selectedImage: "sofab", title: "Armchair"),
    Product(image: "yatakd", selectedImage: "yataks", title: "Bed"),
    Product(image: "lambd", selectedImage: "lambb", title: "Lamp")
]
