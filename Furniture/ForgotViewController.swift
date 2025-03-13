//
//  ForgotViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 13.03.2025.
//

import UIKit

class ForgotViewController: UIViewController {
    @IBOutlet weak var forgotView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadow(view: forgotView)
    }
    func shadow(view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor   // Gölgenin rengi
        view.layer.shadowOffset = CGSize(width: 0, height: 2)  // Gölgenin pozisyonu
        view.layer.shadowOpacity = 0.30    // Gölgenin şeffaflık derecesi
    }


}
