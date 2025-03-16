//
//  ProductViewCell.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

// TODO omer create model class
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
    
    func initialize(with model: ProductItem) {
        let imageUrl = URL(
            string: C.BASE_URL + "products/images/\(String(describing: model.mainImage))"
        )!
        
        productImageView?.af.setImage(
            withURL: imageUrl,
            placeholderImage: UIImage(named: "image_loading")!,
            completion: { [weak self] response in
                if case .failure(let error) = response.result {
                    self?.productImageView.image = UIImage(named: "image_not_available")
                }
            }
        )
        
        productNameLabel.text = model.name
        productPriceLabel.text = (model.priceUnit ?? "$") + String(describing: "\(model.price ?? 0.0)")
    }
}
