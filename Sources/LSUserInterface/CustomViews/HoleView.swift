//
//  HoleView.swift
//
//
//  Created by Алексей Филиппов on 21.04.2024.
//

// Apple
import UIKit

public final class HoleView: DesignedView {
    public var holeRect: CGRect = .zero {
        didSet {
            let path = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.allCorners],
                                    cornerRadii: bounds.size)
            let holePath = UIBezierPath(roundedRect: holeRect,
                                        byRoundingCorners: [.allCorners],
                                        cornerRadii: holeRect.size)
            path.append(holePath)
            
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            mask.fillRule = .evenOdd
            layer.mask = mask
        }
    }
}
