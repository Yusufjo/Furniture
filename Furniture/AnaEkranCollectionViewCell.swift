//
//  AnaEkranCollectionViewCell.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

class AnaEkranCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageAnaSayfa: UIImageView!
    @IBOutlet weak var baslikLabel: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // imageAnaSayfa'ya radius eklemek
        imageAnaSayfa.layer.cornerRadius = 15  // Radius değeri
        imageAnaSayfa.layer.masksToBounds = true  // İçeriğin kenarlara taşmasını engeller
    }
}
