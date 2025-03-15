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
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        forgotView.addShadow()
    }

    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
    }
    
    func localize(){
        forgotPasswordLabel.localize(localizableID: "forgotLabel")
        resetButton.localize(localizableID: "reset")
        emailLabel.localize(localizableID: "email")
    }
}
