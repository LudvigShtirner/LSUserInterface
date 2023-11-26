//
//  DesignedButtonTransparentTextDrawer.swift
//  
//
//  Created by Алексей Филиппов on 16.11.2023.
//

// Apple
import UIKit

public final class DesignedButtonTransparentTextDrawer: DesignedButtonDrawer {
    // MARK: - Inits
    public init() { }
    
    // MARK: - DesignedButtonDrawer
    public func drawButton(_ button: DesignedButton,
                           rect: CGRect) {
        let image = maskedImage(button: button,
                                rect: rect)
        button.setImage(image, for: .normal)
    }
    
    // MARK: - Private methods
    private func maskedImage(button: DesignedButton,
                             rect: CGRect) -> UIImage? {
        guard rect.isEmpty == false,
              let textImage = button.titleLabel?.makeTextImage(with: rect.size),
              let maskImage = textImage.maskImage() else {
            return nil
        }

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        let rect = CGRect(origin: .zero, size: rect.size)
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: .zero, y: -rect.height)
        context.clip(to: rect, mask: maskImage)
        button.tintColor.setFill()
        UIBezierPath(rect: rect).fill()
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
