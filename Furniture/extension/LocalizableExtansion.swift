//
//  LocalizableExtansion.swift
//  Furniture
//
//  Created by yusuf Şentürk on 12.03.2025.
//

import Foundation
import UIKit

extension UIButton {
    func localize(localizableID: String) {
        let localizableTitle = NSLocalizedString(localizableID, comment: "")
        self.setTitle(localizableTitle, for: .normal)
    }
}

extension UILabel {
    func localize(localizableID: String) {
        let localizableText = NSLocalizedString(localizableID, comment: "")
        self.text = localizableText
    }
}
