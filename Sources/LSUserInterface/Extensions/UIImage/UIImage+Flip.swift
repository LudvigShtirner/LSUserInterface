//
//  UIImage+Flip.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

import UIKit

public extension UIImage {
    func flipImage(direction: UIImageFlipDirection) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return self
        }
        context.translateBy(x: direction.isHorizontal ? size.width : 0.0,
                            y: direction.isVertical ? 0.0 : size.height)
        context.scaleBy(x: direction.isHorizontal ? -scale : 1,
                        y: direction.isVertical ? 1 : -scale)
        context.draw(getCGImage(),
                     in: CGRect(origin: .zero,
                                size: size))
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return self
        }
        return newImage
    }
}

public enum UIImageFlipDirection {
    case horizontal
    case vertical
    case both
    
    var isHorizontal: Bool {
        self != .vertical
    }
    
    var isVertical: Bool {
        self != .horizontal
    }
}
