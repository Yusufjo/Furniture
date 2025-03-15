//
//  HomeViewController+TableView.swift
//  Furniture
//
//  Created by yusuf Şentürk on 9.03.2025.
//


// TODO omer create two different Delegates for each collection view
import UIKit
extension HomeViewController: UICollectionViewDelegate ,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productsCollectionView {
            return homeProducts.count
        } else if collectionView == categoriesCollectionView {
            return categories.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeUpCollection", for: indexPath) as! HomeUpCollectionViewCell
            let category = categories[indexPath.item]
            
            let imageName = (selectedCategory == category.title) ? category.selectedImage : category.image
            cell.background.image = UIImage(named: imageName)
            cell.nameLabel.text = category.title
            if selectedCategory == category.title {
                cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
                cell.nameLabel.textColor = UIColor.black
            } else {
                cell.nameLabel.font = UIFont.systemFont(ofSize: 16)
                cell.nameLabel.textColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0)
            }
            
            return cell
        } else if collectionView == productsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
            let products = homeProducts[indexPath.item]
            
            cell.imageAnaSayfa.image = UIImage(named: products.image)
            cell.baslikLabel.text = products.title
            cell.fiyatLabel.text = products.price
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = categories[indexPath.item]
        
        if selectedCategory == selectedProduct.title {
            selectedCategory = nil
        } else {
            selectedCategory = selectedProduct.title
        }
        
        collectionView.reloadData()
    }
}
