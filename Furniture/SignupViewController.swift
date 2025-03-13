//
//  SignupViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 4.03.2025.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    @IBOutlet weak var signUpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.addShadow()
        localizeUIElements()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        sender.signUpController(nameTextField.text ?? "" , emailTextField.text ?? "", passwordTextField.text ?? "", confirmPasswordTextField.text ?? "") {
            title, message in
            self.errorMessage(title: title, message: message)
        }
    }
    
        
    func localizeUIElements() {
        welcomeLabel.localize(localizableID: "welcome")
        nameLabel.localize(localizableID: "name")
        emailLabel.localize(localizableID: "email")
        passwordLabel.localize(localizableID: "password")
        confirmPasswordLabel.localize(localizableID: "confirm")
        alreadyHaveAccountLabel.localize(localizableID: "already")
        
        signupButton.localize(localizableID: "signUp")
        signInButton.localize(localizableID: "signIn")
    }
}
