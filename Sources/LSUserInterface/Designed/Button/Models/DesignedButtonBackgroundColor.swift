//
//  DesignedButtonBackgroundColor.swift
//  
//
//  Created by Алексей Филиппов on 15.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Свойство цвета заднего фона отображения с обработкой изменения стиля
public struct DesignedButtonBackgroundColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private var colorSet: ColorSet
    
    // MARK: - Life cycle
    init(colorSet: ColorSet) {
        self.colorSet = colorSet
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        let colorMap = colorSet.current(isHighlighted: element.isHighlighted,
                                        isEnabled: element.isEnabled)
        element.backgroundColor = colorMap.color(for: element)
    }
}
