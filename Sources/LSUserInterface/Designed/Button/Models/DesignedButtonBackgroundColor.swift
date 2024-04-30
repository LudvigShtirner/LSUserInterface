//
//  DesignedButtonBackgroundColor.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public struct DesignedButtonBackgroundColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let colorSet: Parameter
    
    // MARK: - Life cycle
    init(colorSet: Parameter) {
        self.colorSet = colorSet
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.backgroundColor = colorSet.current(isHighlighted: element.isHighlighted,
                                                   isEnabled: element.isEnabled)
        .color(for: element)
    }
}
