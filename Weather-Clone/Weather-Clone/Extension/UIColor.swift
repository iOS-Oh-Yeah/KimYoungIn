//
//  UIColor.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

extension UIColor {
    
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    class var weatherBackground: UIColor { UIColor(hex: 0x000000).withAlphaComponent(0.1) }
}
