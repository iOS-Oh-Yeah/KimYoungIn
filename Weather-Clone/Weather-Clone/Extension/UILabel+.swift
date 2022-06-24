//
//  UILabel++.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

extension UILabel {
    
    func addLabelShadow() {
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}
