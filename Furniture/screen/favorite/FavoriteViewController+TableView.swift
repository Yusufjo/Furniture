//
//  FavoriteItemViewController+TableView.swift
//  Furniture
//
//  Created by yusuf Şentürk on 9.03.2025.
//

import Foundation
import UIKit


extension FavoriteViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell") as! FavoriteTableViewCell
        let favorite = favorites[indexPath.row]
        cell.favoritePriceLabel.text = "\(favorite.price) $"
        cell.favoriteImageView.image = UIImage(named: favorite.image)
        cell.favoriteTitleLabel.text = favorite.title
        
        return cell
    }
}
