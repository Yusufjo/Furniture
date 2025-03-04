//
//  ViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 2.03.2025.
//

import UIKit

class AnaSayfaViewController: UIViewController,UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var anasayfaFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var anaEkranCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "anasayfaCell", for: indexPath) as! AnaEkranCollectionViewCell
        let products = homeProducts[indexPath.item]
        
        cell.imageAnaSayfa.image = UIImage(named: products.image)
        cell.baslikLabel.text = products.title
        cell.fiyatLabel.text = products.price
        return cell
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let screenWidth = UIScreen.main.bounds.width // Ekran genişliğini al
        let numberOfColumns: CGFloat = 2 // 2 sütun kullanıyoruz
        
        // Boşluğu ekran genişliğine göre ayarla
        let spacing: CGFloat = screenWidth > 400 ? 18 : 9  // Büyük ekranlar için 18, küçük ekranlar için 10

        let collectionWidth = anaEkranCollectionView.bounds.width
        let totalSpacing = spacing * (numberOfColumns + 1)
        let cellWidth = (collectionWidth - totalSpacing) / numberOfColumns
        let cellHeight: CGFloat = 150

        anasayfaFlowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        anasayfaFlowLayout.minimumInteritemSpacing = spacing
        anasayfaFlowLayout.minimumLineSpacing = spacing
        anasayfaFlowLayout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == anaEkranCollectionView {
            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController {
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        anaEkranCollectionView.delegate = self
        anaEkranCollectionView.dataSource = self
    }


}

