//
//  FavoriteViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 5.03.2025.
//

import UIKit

class FavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var favorites: [Favorites] = []
    @IBOutlet weak var favoritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        // Do any additional setup after loading the view.
        
        favorites = [
            Favorites(image: "anasayfaUrun4", title: "Black Simple Lamp", price: 12.00, quantity: 1 ),
            Favorites(image: "anasayfaUrun3", title: "Minimal Stand", price: 25.00, quantity: 1),
            Favorites(image: "anasayfaUrun2", title: "Cofee Chair", price: 20.00, quantity: 1),
            Favorites(image: "anasayfaUrun1", title: "Simple Desk", price: 50.00, quantity: 1),
            Favorites(image: "favoritesehpa", title: "Coffee Table", price: 50.00, quantity: 1)]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell") as! FavoriteTableViewCell
        let favorite = favorites[indexPath.row]
        cell.favoritePriceLabel.text = "\(favorite.price)"
        cell.favoriteImageView.image = UIImage(named: favorite.image)
        cell.favoriteTitleLabel.text = favorite.title
        
        return cell
    }
    @IBAction func addAllMyCartButtonTapped(_ sender: Any) {
    }
    
}
