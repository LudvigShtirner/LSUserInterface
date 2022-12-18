//
//  DesignedViewBorder.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

import SupportCode
// Apple
import UIKit

/// Свойство границы отображения
struct DesignedViewBorder: DesignedViewParameter {
    // MARK: - Data
    private var width: CGFloat
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(width: CGFloat,
         colorMap: ColorMap) {
        self.width = width
        self.colorMap = colorMap
    }
    
    // MARK: - BaseDesignedViewParameter
    typealias Parameter = (CGFloat, ColorMap)
    
    public func apply(to view: UIView) {
        view.layer.borderWidth = width
        view.layer.borderColor = colorMap.color(for: view).cgColor
    }
}
