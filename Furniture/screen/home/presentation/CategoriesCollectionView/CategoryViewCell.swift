//
//  CategoriesViewCell.swift
//  Furniture
//
//  Created by yusuf Şentürk on 5.03.2025.
//

import UIKit

// TODO omer create model class
class CategoryViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    static let Identifier = "CategoriesViewCell"
    
    func initialize(with model: CategoryItem) {
        background.layer.cornerRadius = 12
        nameLabel.text = model.title
        if model.isSelected {
            nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
            nameLabel.textColor = UIColor.black
            image.image = UIImage(named: model.selectedImageName)
        } else {
            nameLabel.font = UIFont.systemFont(ofSize: 14)
            nameLabel.textColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0)
            image.image = UIImage(named: model.imageName)
        }
        
    }
}
