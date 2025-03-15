//
//  ProductViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 4.03.2025.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var selectedProduct: HomeProduct?
    @IBOutlet weak var productFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    let images = ["sehpaSellected", "anasayfaUrun2", "anasayfaUrun1"]
    
    var itemCount = 1
    var unitPrice: Double = 50.0
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.layer.cornerRadius = 30
        customView.layer.masksToBounds = true
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.isPagingEnabled = true
        productCollectionView.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        productFlowLayout.scrollDirection = .horizontal
        // Do any additional setup after loading the view.
        

        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGesture.direction = .right // Sağa kaydırma hareketi
        view.addGestureRecognizer(swipeGesture)
    }
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        return  cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
