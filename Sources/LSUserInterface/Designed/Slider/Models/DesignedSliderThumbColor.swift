//
//  DesignedSliderThumbColor.swift
//
//
//  Created by Алексей Филиппов on 24.06.2024.
//

// Apple
import UIKit

struct DesignedSliderThumbColors: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let thumbColors: Parameter
    
    // MARK: - Inits
    init(thumbColors: Parameter) {
        self.thumbColors = thumbColors
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UISlider
    func apply(to element: Element) {
        let colorMap = thumbColors.current(isHighlighted: element.isHighlighted,
                                           isEnabled: element.isEnabled)
        element.thumbTintColor = colorMap.color(for: element)
    }
}
