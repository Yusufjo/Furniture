//
//  HomeViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesFlowLayout: UICollectionViewFlowLayout!
    private let categoriesCollectionViewManager = CategoryCollectionViewManager()
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var productsFlowLayout: UICollectionViewFlowLayout!
    private let productsCollectionViewManager = ProductCollectionViewManager()
    
    @IBOutlet weak var productNotFoundView: UIView!
    @IBOutlet weak var productNotFoundLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var viewModel: HomeViewModel!
    var productList: [ProductResponse] { viewModel.productList }
    
    var selectedCategory: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        initViews()
        observeViewModel()
        viewModel.fetchProducts()
    }
    
    private func initViewModel() {
        let dataSource = ProductsRemoteDataSource()
        let repository = ProductsRepository(productsRemoteDataSource: dataSource)
        self.viewModel = HomeViewModel(productsRepository: repository)
    }
    
    private func observeViewModel() {
        observeProductList()
        observeCategoryList()
        observeNetworkState()
    }
    
    private func observeProductList() {
        viewModel.onProductListUpdated = { [weak self] productList in
            self?.activityIndicator.stopAnimating()
            if productList.isEmpty {
                self?.categoriesCollectionView.isHidden = true
                self?.productsCollectionView.isHidden = true
                self?.productNotFoundView.isHidden = false
                self?.productNotFoundLabel.text = String(localized: "no_products_available")
            } else {
                self?.productsCollectionView.isHidden = false
                self?.productNotFoundView.isHidden = true
                self?.productsCollectionViewManager.productList = productList
                self?.productsCollectionView.reloadData()
            }
        }
    }
    
    private func observeCategoryList() {
        viewModel.onCategoryListUpdated = { [weak self] categoryList in
            self?.categoriesCollectionView.isHidden = false
            self?.categoriesCollectionViewManager.categories = categoryList
            self?.categoriesCollectionView.reloadData()
        }
    }
    
    private func observeNetworkState() {
        viewModel.onNetworkStateChanged = { [weak self] networkState in
            switch networkState {
                case .idle:
                    break
                case .loading:
                    self?.handleLoadingState()
                case .success:
                    self?.handleSuccessState()
                case .error:
                    self?.handleErrorState()
            }
        }
    }
    
    private func handleLoadingState() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        categoriesCollectionView.isHidden = true
        productsCollectionView.isHidden = true
        
    }
    
    private func handleSuccessState() {
        activityIndicator.stopAnimating()
        categoriesCollectionView.isHidden = false
        productsCollectionView.isHidden = false
    }
    
    private func handleErrorState() {
        activityIndicator.stopAnimating()
        categoriesCollectionView.isHidden = true
        productsCollectionView.isHidden = true
        showNetworkErrorAlert()
    }
    
    func showNetworkErrorAlert() {
        let alert = UIAlertController(title: String(localized: "network_error_title"),
                                      message: String(localized: "products_network_error_message"),
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: String(localized: "ok"), style: .cancel)
        alert.addAction(okAction)
        
        let tryAgainAction = UIAlertAction(title: String(localized: "try_again"), style: .default) { [weak self] _ in
            self?.viewModel.fetchProducts()
            alert.dismiss(animated: true)
        }
        alert.addAction(tryAgainAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    private func initViews() {
        initCategoriesCollectionView()
        initProductsCollectionView()
        initCategoriesFlowLayout()
    }
    
    private func initCategoriesCollectionView() {
        categoriesCollectionView.delegate = categoriesCollectionViewManager
        categoriesCollectionView.dataSource = categoriesCollectionViewManager
        categoriesCollectionViewManager.onCategorySelected = { [weak self] category in
            // filterProducts by category
        }
        categoriesCollectionViewManager.onCategoriesUpdated = { [weak self] in
            self?.categoriesCollectionView.reloadData()
        }
    }
    
    private func initProductsCollectionView() {
        productsCollectionView.delegate = productsCollectionViewManager
        productsCollectionView.dataSource = productsCollectionViewManager
        productsCollectionViewManager.onProductListUpdated = { [weak self] in
            self?.productsCollectionView.reloadData()
        }
    }
    
    private func initCategoriesFlowLayout() {
        categoriesFlowLayout.scrollDirection = .horizontal
        categoriesFlowLayout.itemSize = CGSize(width: 60, height: 65)
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


