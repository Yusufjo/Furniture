//
//  FavoriteViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 5.03.2025.
//

import UIKit

class FavoriteViewController: UIViewController {
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
  
    @IBAction func addAllMyCartButtonTapped(_ sender: Any) {
    }
    
}


