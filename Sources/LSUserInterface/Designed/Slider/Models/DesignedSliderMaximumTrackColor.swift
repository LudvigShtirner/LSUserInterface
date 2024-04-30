//
//  DesignedSliderMaximumTrackColor.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

struct DesignedSliderMaximumTrackColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let colorSet: Parameter
    
    // MARK: - Inits
    init(colorSet: Parameter) {
        self.colorSet = colorSet
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UISlider
    func apply(to element: Element) {
        let colorMap = colorSet.current(isHighlighted: element.isHighlighted,
                                        isEnabled: element.isEnabled)
        element.maximumTrackTintColor = colorMap.color(for: element)
    }
}
