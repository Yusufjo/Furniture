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
        shadow(view: loginView)
        // Do any additional setup after loading the view.
    }
    func shadow(view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor   // Gölgenin rengi
        view.layer.shadowOffset = CGSize(width: 0, height: 2)  // Gölgenin pozisyonu
        view.layer.shadowOpacity = 0.09    // Gölgenin şeffaflık derecesi
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
