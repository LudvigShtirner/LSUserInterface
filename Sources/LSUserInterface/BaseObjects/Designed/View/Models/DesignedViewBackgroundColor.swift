//
//  DesignedViewBackgroundColor.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Свойство цвета заднего фона отображения с обработкой изменения стиля
public struct DesignedViewBackgroundColor: DesignedViewParameter, DesignedViewParameterApplyable {
    // MARK: - Data
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(colorMap: ColorMap) {
        self.colorMap = colorMap
    }
    
    // MARK: - BaseDesignedViewParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedViewParameterApplyable
    func apply(to view: UIView) {
        view.backgroundColor = colorMap.color(for: view)
    }
}
