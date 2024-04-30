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
    private let value: ColorMap
    
    // MARK: - Inits
    init(value: ColorMap) {
        self.value = value
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        element.backgroundColor = value.color(for: element)
    }
}
