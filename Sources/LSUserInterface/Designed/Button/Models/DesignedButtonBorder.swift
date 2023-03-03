//
//  DesignedButtonBorder.swift
//  
//
//  Created by Алексей Филиппов on 15.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Свойство границы отображения
public struct DesignedButtonBorder: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let border: ControlBorder
    
    // MARK: - Life cycle
    init(border: ControlBorder) {
        self.border = border
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ControlBorder
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.layer.borderWidth = border.width
        let currentColorMap =  border.colorSet.current(isHighlighted: element.isHighlighted,
                                                       isEnabled: element.isEnabled)
        element.layer.borderColor = currentColorMap.color(for: element).cgColor
    }
}

