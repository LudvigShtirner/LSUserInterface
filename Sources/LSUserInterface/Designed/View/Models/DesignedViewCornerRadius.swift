//
//  DesignedViewCornerRadius.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Свойство скругления ототбражения
public struct DesignedViewCornerRadius: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private var value: CornerRadius
    
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
        }
    }
}
