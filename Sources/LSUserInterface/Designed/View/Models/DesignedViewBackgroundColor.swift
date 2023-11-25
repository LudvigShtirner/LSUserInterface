//
//  DesignedViewBackgroundColor.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

/// Свойство цвета заднего фона отображения с обработкой изменения стиля
public struct DesignedViewBackgroundColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let value: BackgroundColor
    
    // MARK: - Inits
    init(value: BackgroundColor) {
        self.value = value
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = BackgroundColor
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        switch value {
        case .fixed(let colorMap):
            element.backgroundColor = colorMap.color(for: element)
        case .baseOnState(let colorSet):
            element.backgroundColor = colorSet.normal.color(for: element)
        }
    }
}

public enum BackgroundColor {
    case fixed(ColorMap)
    case baseOnState(ColorSet)
}
