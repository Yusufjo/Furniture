//
//  ViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var anasayfaFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var ustCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var anaEkranCollectionView: UICollectionView!
    var selectedCategory: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegate ve DataSource bağlantıları
        ustCollectionView.delegate = self
        ustCollectionView.dataSource = self
        anaEkranCollectionView.delegate = self
        anaEkranCollectionView.dataSource = self
        
        let screenWidth = ustCollectionView.frame.width
        let numberOfCells: CGFloat = 5
        let spacing: CGFloat = 10
        
        let totalSpacing = spacing * (numberOfCells - 1)
        let itemWidth = (screenWidth - totalSpacing) / numberOfCells
        let itemHeight: CGFloat = 75 
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumInteritemSpacing = spacing
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let screenWidth = UIScreen.main.bounds.width
        let numberOfColumns: CGFloat = 2
        
        let spacing: CGFloat = screenWidth > 400 ? 18 : 9
        
        let collectionWidth = anaEkranCollectionView.bounds.width
        let totalSpacing = spacing * (numberOfColumns + 1)
        let cellWidth = (collectionWidth - totalSpacing) / numberOfColumns
        let cellHeight: CGFloat = 150
        
        anasayfaFlowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        anasayfaFlowLayout.minimumInteritemSpacing = spacing
        anasayfaFlowLayout.minimumLineSpacing = spacing
        anasayfaFlowLayout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
}


