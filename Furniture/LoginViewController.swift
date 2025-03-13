//
//  LoginViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 4.03.2025.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.addShadow()
        localizeUIElements()
    }
    @IBAction func loginButton(_ sender: Any) {
        loginController()
    }
    
    func localizeUIElements() {
        loginButton.localize(localizableID: "logIn")
        forgotButton.localize(localizableID: "forgot")
        signUpButton.localize(localizableID: "signUp")
        
        
        helloLabel.localize(localizableID: "hello")
        welcomeBackLabel.localize(localizableID: "welcome")
        emailLabel.localize(localizableID: "email")
        passwordLabel.localize(localizableID: "password")
    }
    
}
