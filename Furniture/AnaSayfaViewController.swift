//
//  ViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

class AnaSayfaViewController: UIViewController,UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
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

             // Üst CollectionView Ayarları (Yatay kaydırma)
             let screenWidth = ustCollectionView.frame.width
             let numberOfCells: CGFloat = 5 // Ekranda 5 küçük hücre
             let spacing: CGFloat = 10 // Hücreler arası boşluk
             
             let totalSpacing = spacing * (numberOfCells - 1) // Toplam boşluk
             let itemWidth = (screenWidth - totalSpacing) / numberOfCells // Hücre genişliği
             let itemHeight: CGFloat = 75 // Hücre yüksekliği
             
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
         
         func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             if collectionView == anaEkranCollectionView {
                    return homeProducts.count // Dizinin eleman sayısını döndür
                } else if collectionView == ustCollectionView {
                    return categories.count
                }
                return 0
         }
         
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             if collectionView == ustCollectionView {
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ustCollection", for: indexPath) as! UstCollectionViewCell
                 let category = categories[indexPath.item]
                 
                 let imageName = (selectedCategory == category.title) ? category.selectedImage : category.image
                         cell.background.image = UIImage(named: imageName)
                         cell.nameLabel.text = category.title
                 if selectedCategory == category.title {
                         cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
                     cell.nameLabel.textColor = UIColor.black
                     } else {
                         cell.nameLabel.font = UIFont.systemFont(ofSize: 16)
                         cell.nameLabel.textColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0)
                     }

                 return cell
             } else if collectionView == anaEkranCollectionView {
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "anasayfaCell", for: indexPath) as! AnaEkranCollectionViewCell
                 let products = homeProducts[indexPath.item]
                 
                 cell.imageAnaSayfa.image = UIImage(named: products.image)
                 cell.baslikLabel.text = products.title
                 cell.fiyatLabel.text = products.price
                 return cell
             }
             return UICollectionViewCell()
         }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = categories[indexPath.item]

        // Aynı kategoriye tıklanırsa seçimi kaldır
        if selectedCategory == selectedProduct.title {
            selectedCategory = nil
        } else {
            selectedCategory = selectedProduct.title
        }

        collectionView.reloadData() // CollectionView'u güncelle
    }
}

