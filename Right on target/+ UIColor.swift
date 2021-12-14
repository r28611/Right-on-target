//
//  + UIColor.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 14/12/2021.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: CGFloat(arc4random()) / CGFloat(UInt32.max),
            green: CGFloat(arc4random()) / CGFloat(UInt32.max),
            blue: CGFloat(arc4random()) / CGFloat(UInt32.max),
            alpha: 1.0
        )
    }

}
