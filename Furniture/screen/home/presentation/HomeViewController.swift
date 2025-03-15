//
//  ViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var productsFlowLayout: UICollectionViewFlowLayout!
    
    var selectedCategory: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        initCollectionViews()
        initCategoriesFlowLayout()
    }
    
    private func initCollectionViews() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
    }
    
    private func initCategoriesFlowLayout() {
        let screenWidth = categoriesCollectionView.frame.width
        let numberOfCells: CGFloat = 5
        let spacing: CGFloat = 10
        
        let totalSpacing = spacing * (numberOfCells - 1)
        let itemWidth = (screenWidth - totalSpacing) / numberOfCells
        let itemHeight: CGFloat = 75
        
        categoriesFlowLayout.scrollDirection = .horizontal
        categoriesFlowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        categoriesFlowLayout.minimumLineSpacing = spacing
        categoriesFlowLayout.minimumInteritemSpacing = spacing
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let screenWidth = UIScreen.main.bounds.width
        let numberOfColumns: CGFloat = 2
        
        let spacing: CGFloat = screenWidth > 400 ? 18 : 9
        
        let collectionWidth = productsCollectionView.bounds.width
        let totalSpacing = spacing * (numberOfColumns + 1)
        let cellWidth = (collectionWidth - totalSpacing) / numberOfColumns
        let cellHeight: CGFloat = 150
        
        productsFlowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        productsFlowLayout.minimumInteritemSpacing = spacing
        productsFlowLayout.minimumLineSpacing = spacing
        productsFlowLayout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
}


