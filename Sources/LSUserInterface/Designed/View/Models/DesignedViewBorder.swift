//
//  DesignedViewBorder.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

/// Свойство границы отображения
public struct DesignedViewBorder: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let border: Border
    
    // MARK: - Inits
    init(border: Border) {
        self.border = border
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = Border
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        switch border {
        case .fixed(let cGFloat, let colorMap):
            element.layer.borderWidth = cGFloat
            element.layer.borderColor = colorMap.color(for: element).cgColor
        case .changeable(let cGFloat, let colorSet):
            element.layer.borderWidth = cGFloat
            element.layer.borderColor = colorSet.normal.color(for: element).cgColor
        }
    }
}
