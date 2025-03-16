//
//  FavoriteTableViewCell.swift
//  Furniture
//
//  Created by yusuf Şentürk on 5.03.2025.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteTitleLabel: UILabel!
    @IBOutlet weak var favoritePriceLabel: UILabel!
    @IBOutlet weak var favoriteDeleteButton: UIButton!
    @IBOutlet weak var favoriteSepetButton: UIButton!
    
    var deleteAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func deleteButton(_ sender: Any) {
        deleteAction?()
    }
    
}
