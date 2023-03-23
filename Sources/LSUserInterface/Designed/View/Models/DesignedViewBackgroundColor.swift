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
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(colorMap: ColorMap) {
        self.colorMap = colorMap
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        element.backgroundColor = colorMap.color(for: element)
    }
}
