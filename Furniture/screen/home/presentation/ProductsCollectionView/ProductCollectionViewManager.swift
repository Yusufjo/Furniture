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
    var productList: [ProductItem] = [] {
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
        cell.initialize(with: product)
        return cell
    }
    
}
