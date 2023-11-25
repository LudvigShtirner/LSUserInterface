//
//  DesignedSwitchOnColor.swift
//  
//
//  Created by Алексей Филиппов on 23.09.2023.
//

// Apple
import UIKit

public struct DesignedSwitchOnColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let onColor: Parameter
    
    // MARK: - Inits
    init(onColor: Parameter) {
        self.onColor = onColor
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UISwitch
    func apply(to element: Element) {
        element.onTintColor = onColor.color(for: element)
    }
}
