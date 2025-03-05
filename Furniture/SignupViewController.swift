//
//  SignupViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 4.03.2025.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var signUpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        shadow(view: signUpView)
        // Do any additional setup after loading the view.
    }
    func shadow(view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor   // Gölgenin rengi
        view.layer.shadowOffset = CGSize(width: 0, height: 2)  // Gölgenin pozisyonu
        view.layer.shadowOpacity = 0.30    // Gölgenin şeffaflık derecesi
        
    }
   
    
}
