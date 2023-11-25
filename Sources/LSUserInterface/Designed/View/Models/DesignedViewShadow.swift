//
//  DesignedViewShadow.swift
//  
//
//  Created by Алексей Филиппов on 21.04.2023.
//

// Apple
import UIKit

public struct DesignedViewShadow: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let value: Parameter
    
    // MARK: - Inits
    init(value: Parameter) {
        self.value = value
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = Shadow
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        element.clipsToBounds = false
        let layer = element.layer
        let cornerRadius = {
            switch value.radius {
            case .circled:
                return element.bounds.minSide.half
            case .fixed(let value):
                return value
            }
        }()
        layer.shadowColor = value.color.color(for: element).cgColor
        layer.shadowRadius = cornerRadius
        layer.shadowOpacity = value.opacity
        layer.shadowOffset = value.offset
//        layer.shadowPath = UIBezierPath(roundedRect: element.bounds,
//                                        byRoundingCorners: [.allCorners],
//                                        cornerRadii: .init(width: cornerRadius,
//                                                           height: cornerRadius)).cgPath
    }
}
