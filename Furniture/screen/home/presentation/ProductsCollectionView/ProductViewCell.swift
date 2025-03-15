//
//  ProductViewCell.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    // Hard-coding string engellemek için
    static let Identifier = "ProductViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.layer.cornerRadius = 15
        productImageView.layer.masksToBounds = true
    }
}
