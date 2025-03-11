//
//  NotificationViewController+TableView.swift
//  Furniture
//
//  Created by yusuf Şentürk on 9.03.2025.
//

import Foundation
import UIKit

extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as! NotificationTableViewCell
        cell.natificationImageView.image = UIImage(named: "anasayfaUrun1")
        cell.subTitle.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec."
        cell.titleLabel.text = "Your order #123456789 has been confirmed"
        return cell
    }
}
