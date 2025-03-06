//
//  CartTableViewCell.swift
//  Furniture
//
//  Created by yusuf Şentürk on 5.03.2025.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var cartDeleteButton: UIButton!
    @IBOutlet weak var adetLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var cartTileLabel: UILabel!
    @IBOutlet weak var cartimageView: UIImageView!
    var deleteAction: (() -> Void)?
    var plusAction: (() -> Void)?
    var minusAction: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func eksiButton(_ sender: Any) {
    }
    @IBAction func plusButton(_ sender: Any) {
    }
    @IBAction func cartDeleteButton(_ sender: Any) {
    }
}
