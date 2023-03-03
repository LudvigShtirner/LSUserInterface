//
//  DesignedButtonCornerRadius.swift
//  
//
//  Created by Алексей Филиппов on 15.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Свойство скругления ототбражения
public struct DesignedButtonCornerRadius: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private var value: CornerRadius
    
    // MARK: - Life cycle
    init(value: CornerRadius) {
        self.value = value
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = CornerRadius
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        switch value {
        case .fixed(let cGFloat):
            element.layer.cornerRadius = cGFloat
        case .circled:
            element.layer.cornerRadius = element.bounds.minSide.half
        }
    }
}

