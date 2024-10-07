//
//  DesignedViewCornerRadius.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

/// Свойство скругления ототбражения
public struct DesignedViewCornerRadius: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let value: CornerRadius
    
    // MARK: - Inits
    init(value: CornerRadius) {
        self.value = value
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = CornerRadius
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        switch value {
        case .fixed(let cGFloat):
            element.layer.cornerRadius = cGFloat
        case .circled:
            element.layer.cornerRadius = element.bounds.minSide.half
        case .masked(let corners, let radius):
            element.layer.maskedCorners = corners.caCornerMask
            element.layer.cornerRadius = radius
        }
    }
}

extension UIRectCorner {
    var caCornerMask: CACornerMask {
        var cornersMask = CACornerMask()
        if self.contains(.topLeft) {
            cornersMask.insert(.layerMinXMinYCorner)
        }
        if self.contains(.topRight) {
            cornersMask.insert(.layerMaxXMinYCorner)
        }
        if self.contains(.bottomLeft) {
            cornersMask.insert(.layerMinXMaxYCorner)
        }
        if self.contains(.bottomRight) {
            cornersMask.insert(.layerMaxXMaxYCorner)
        }
        return cornersMask
    }
}
