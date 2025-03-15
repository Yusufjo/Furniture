//
//  CategoriesCollectionViewManager.swift
//  Furniture
//
//  Created by Ömer Faruk Okumuş on 15.03.2025.
//

import UIKit

class CategoryCollectionViewManager: NSObject, UICollectionViewDelegate ,UICollectionViewDataSource{
    
    var categories: [CategoryItem] = [] {
        didSet {
            onCategoriesUpdated?()
        }
    }
    
    var onCategoriesUpdated: (() -> Void)?
    var onCategorySelected: ((CategoryItem) -> Void)?
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.Identifier, for: indexPath) as! CategoryViewCell
        let category = categories[indexPath.item]
        cell.initialize(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedCategory = categories[indexPath.item]
        for i in categories.indices {
            categories[i].isSelected = false
        }
        for i in categories.indices {
            if categories[i].title == selectedCategory.title {
                categories[i].isSelected = true
            }
        }
        onCategorySelected?(selectedCategory)
        collectionView.reloadData()
    }
}

