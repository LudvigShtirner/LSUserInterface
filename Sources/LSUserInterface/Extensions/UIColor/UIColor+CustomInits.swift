//
//  UIColor+CustomInits.swift
//
//
//  Created by Алексей Филиппов on 26.11.2023.
//

// Apple
import UIKit

public extension UIColor {
    static func make(with red: Int, _ green: Int, _ blue: Int) -> UIColor {
        UIColor(red: channel(red), green: channel(green), blue: channel(blue), alpha: 1.0)
    }
}
