//
//  ViewExtansion.swift
//  Furniture
//
//  Created by yusuf Şentürk on 9.03.2025.
//

import Foundation
import UIKit
import FirebaseAuth

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.30
    }
}

extension UIButton {
    func signUpController(_ nameText :String,_ emailText :String,_ passwordText :String,_ confirmPasswordText :String, onError: @escaping (String, String) -> Void) {
        let textFields = [nameText, emailText, passwordText, confirmPasswordText]
        if textFields.allSatisfy({$0.isEmpty == true}){
            onError(NSLocalizedString("error", comment: ""), NSLocalizedString("empty", comment: ""))
        }
        else if passwordText != confirmPasswordText{
            onError(NSLocalizedString("error", comment: ""), NSLocalizedString("errorMessageConfirm", comment: ""))
        }
        else {
            Auth.auth().createUser(withEmail: emailText, password: passwordText) {  AuthDataResult, error in
                if error != nil {
                    onError(NSLocalizedString("error", comment: ""), NSLocalizedString("errorMessage", comment: "") )
                    
                }
                else {
                    onError(NSLocalizedString("sucessLogin", comment: ""),NSLocalizedString("successLogin", comment: ""))
                }
            }
        }
    }
}



extension UIButton {
    func loginController(_ emailText: String, _ passwordText: String, onError: @escaping (String, String) -> Void, success: @escaping () -> Void) {
        if emailText.isEmpty == true || passwordText.isEmpty == true{
            onError( NSLocalizedString("error", comment: ""), NSLocalizedString("empty", comment: ""))
        }else{
            Auth.auth().signIn(withEmail: emailText, password: passwordText) { result, error in
                if let error = error {
                    // Eğer hata varsa, mesaj göster
                    onError( NSLocalizedString("error", comment: ""), NSLocalizedString("errorMessage", comment: ""))
                } else {
                    // Eğer başarılı ise, seguiyi tetikle
                    success()
                }
            }
        }
    }
}

extension UIViewController {
    func errorMessage(title:String, message:String){
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

