//
//  ProfileViewController.swift
//  Furniture
//
//  Created by yusuf Şentürk on 5.03.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var myOrdersButton: UIView!
    @IBOutlet weak var shippingAdressButton: UIView!
    @IBOutlet weak var paymentMethod: UIView!
    @IBOutlet weak var myReviewsButton: UIView!
    @IBOutlet weak var settingButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)

        
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true

        shadow(view: myOrdersButton)
        shadow(view: shippingAdressButton)
        shadow(view: paymentMethod)
        shadow(view: myReviewsButton)
        shadow(view: settingButton)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(myOrdersButtonTapped))
//        myOrdersButton.addGestureRecognizer(tapGesture)
//        myOrdersButton.isUserInteractionEnabled = true
//        
//        let shippingTapGesture = UITapGestureRecognizer(target: self, action: #selector(shippingAdressButtonTapped))
//        shippingAdressButton.addGestureRecognizer(shippingTapGesture)
//        shippingAdressButton.isUserInteractionEnabled = true
//        
//        
//        let paymentTapGesture = UITapGestureRecognizer(target: self, action: #selector(paymentMethodTapped))
//        paymentMethod.addGestureRecognizer(paymentTapGesture)
//        paymentMethod.isUserInteractionEnabled = true
//        
//        let reviewsTapGesture = UITapGestureRecognizer(target: self, action: #selector(myReviewstMethodTapped))
//        myReviewsButton.addGestureRecognizer(reviewsTapGesture)
//        myReviewsButton.isUserInteractionEnabled = true
//        
//        let settingGesture = UITapGestureRecognizer(target: self, action: #selector(settingButtonTapped))
//        settingButton.addGestureRecognizer(settingGesture)
//        settingButton.isUserInteractionEnabled = true
    }
//    @objc func myOrdersButtonTapped() {
//        if let orderViewController = storyboard?.instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController {
//              navigationController?.pushViewController(orderViewController, animated: true)
//          }
//    }
//    @objc func shippingAdressButtonTapped() {
//        if let shippingViewController = storyboard?.instantiateViewController(withIdentifier: "ShippingViewController") as? ShippingViewController {
//              navigationController?.pushViewController(shippingViewController, animated: true)
//          }
//    }
//    @objc func paymentMethodTapped() {
//        if let paymentViewController = storyboard?.instantiateViewController(withIdentifier: "paymentViewController") as? PaymentViewController {
//              navigationController?.pushViewController(paymentViewController, animated: true)
//          }
//    }
//    @objc func myReviewstMethodTapped() {
//        if let myReviewsViewController = storyboard?.instantiateViewController(withIdentifier: "MyReviewsViewController") as? MyReviewsViewController {
//              navigationController?.pushViewController(myReviewsViewController, animated: true)
//          }
//    }
//    @objc func settingButtonTapped() {
//        if let settingViewController = storyboard?.instantiateViewController(withIdentifier: "settingViewController") as? SettingViewController {
//              navigationController?.pushViewController(settingViewController, animated: true)
//          }
//    }
    func shadow(view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor   // Gölgenin rengi
        view.layer.shadowOffset = CGSize(width: 0, height: 2)  // Gölgenin pozisyonu
        view.layer.shadowOpacity = 0.09    // Gölgenin şeffaflık derecesi
        view.layer.shadowRadius = 4
    }
    
    @IBAction func signOutButton(_ sender: Any) {
    }
    
}
