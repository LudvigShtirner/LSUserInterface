//
//  UIImage+Flip.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

import UIKit

/// Расширение для отражения изображения
public extension UIImage {
    /// Отразить изображение
    /// - Parameters:
    ///   - horizontally: флаг отражения по горизонтали
    ///   - vertically: флаг отражения по вертикали
    /// - Returns: отраженное изображение, если успешно, обычное - в случае ошибки
    func flipImage(horizontally: Bool,
                   vertically: Bool) -> UIImage {
        if !horizontally && !vertically {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return self
        }
        context.translateBy(x: horizontally ? size.width : 0.0,
                            y: vertically ? 0.0 : size.height)
        context.scaleBy(x: horizontally ? -scale : 1,
                        y: vertically ? 1 : -scale)
        context.draw(getCGImage(),
                     in: CGRect(origin: .zero,
                                size: size))
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return self
        }
        return newImage
    }
}
