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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.addShadow()
    }
    @IBAction func loginButton(_ sender: Any) {
        if emailTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true{
            errorMessage(title: "Hata!", message: "Lütfen boş alan bırakmayınız!")
        }else{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, error in
                if let error = error {
                    // Eğer hata varsa, mesaj göster
                    self.errorMessage(title: "Giriş Hatası", message: error.localizedDescription)
                } else {
                    // Eğer başarılı ise, seguiyi tetikle
                    self.performSegue(withIdentifier: "toFurniture", sender: nil)
                }
            }
        }
    }
    
    func errorMessage(title:String,message:String){
        let alert = UIAlertController(title: title, message:message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
