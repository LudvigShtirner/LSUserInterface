//
//  UIColor+Random.swift
//
//
//  Created by Алексей Филиппов on 25.11.2023.
//

// Apple
import UIKit

public extension UIColor {
    static func random() -> UIColor {
        UIColor(red: channel(.random(in: (0 ... 255))),
                green: channel(.random(in: (0 ... 255))),
                blue: channel(.random(in: (0 ... 255))),
                alpha: 1.0)
    }
    
    static func channel(_ value: Int) -> CGFloat {
        CGFloat(value.inRange(min: 0, max: 255)) / 255.0
    }
}
