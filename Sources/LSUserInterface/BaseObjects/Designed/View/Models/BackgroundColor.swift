//
//  BackgroundColor.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

import SupportCode

/// Свойство цвета заднего фона отображения с обработкой изменения стиля
struct BackgroundColor: BaseDesignedViewParameter {
    // MARK: - Data
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(colorMap: ColorMap) {
        self.colorMap = colorMap
    }
    
    // MARK: - BaseDesignedViewParameter
    typealias Parameter = ColorMap
    
    public func apply(to view: BaseDesignedView) {
        view.backgroundColor = colorMap.color(for: view)
    }
}
