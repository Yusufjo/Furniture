//
//  ProductsCollectionViewManager.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

import UIKit
import Alamofire
import AlamofireImage

class ProductCollectionViewManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // CollectionView'ın kullanacağı data
    var productList: [ProductResponse] = [] {
        didSet { // Data setlendiğinde bu blok çalışır
            onProductListUpdated?()
        }
    }
    
    // Yukarıdaki data değişince çalışacak fonksiyon
    var onProductListUpdated: (() -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductViewCell.Identifier, for: indexPath) as! ProductViewCell
        let product = productList[indexPath.item]
    
        let imageUrl = URL(
            string: "https://furniture-shopping-spring.onrender.com/api/products/images/\(product.mainImage)"
        )!
        
        cell.productImageView?.af
            .setImage(
                withURL: imageUrl,
                placeholderImage: UIImage(named: "image_loading")!
            ) { response in
                if case .failure(let error) = response.result {
                    cell.productImageView.image = UIImage(named: "image_not_available")
                }
            }
        
        cell.productNameLabel.text = product.name
        cell.productPriceLabel.text = "\(product.price ?? 0.0)"
        return cell
    }
    
}
