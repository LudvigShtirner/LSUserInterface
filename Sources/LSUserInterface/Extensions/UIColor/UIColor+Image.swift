//
//  UIColor+Image.swift
//
//
//  Created by Алексей Филиппов on 24.11.2023.
//

// Apple
import UIKit

public extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
