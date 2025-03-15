//
//  ForgotViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 15.03.2025.
//

import UIKit

class ForgotViewController: UIViewController {
    @IBOutlet weak var forgotView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotView.addShadow()
    }

    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
    }
    
}
