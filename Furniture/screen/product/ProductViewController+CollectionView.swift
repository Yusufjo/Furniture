//
//  ProductViewController+CollectionView.swift
//  Furniture
//
//  Created by yusuf Şentürk on 9.03.2025.
//

import Foundation
import UIKit

extension ProductViewController: UICollectionViewDelegate ,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        return  cell
    }
}
