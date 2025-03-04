//
//  ProductCollectionViewCell.swift
//  Furniture
//
//  Created by yusuf Şentürk on 4.03.2025.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    override init(frame: CGRect) {
         super.init(frame: frame)
         // `init` içinde setupContentView çağırmamıza gerek yok çünkü layoutSubviews'ü kullanacağız
     }

     required init?(coder: NSCoder) {
         super.init(coder: coder)
         // `init` içinde setupContentView çağırmamıza gerek yok çünkü layoutSubviews'ü kullanacağız
     }

     override func layoutSubviews() {
         super.layoutSubviews()

         // contentView'in bounds'ı değiştiğinde maskeyi yeniden uygulamak için layoutSubviews içinde çağırıyoruz
         let maskPath = UIBezierPath(
             roundedRect: contentView.bounds,
             byRoundingCorners: [.bottomLeft],  // Sadece sol alt köşe
             cornerRadii: CGSize(width: 60, height: 60) // Radius değeri
         )
         
         let shapeLayer = CAShapeLayer()
         shapeLayer.path = maskPath.cgPath
         contentView.layer.mask = shapeLayer
     }
 }
