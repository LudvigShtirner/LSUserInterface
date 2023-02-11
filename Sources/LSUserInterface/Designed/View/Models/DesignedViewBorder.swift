//
//  DesignedViewBorder.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Свойство границы отображения
public struct DesignedViewBorder: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private var width: CGFloat
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(width: CGFloat,
         colorMap: ColorMap) {
        self.width = width
        self.colorMap = colorMap
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = (CGFloat, ColorMap)
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        element.layer.borderWidth = width
        element.layer.borderColor = colorMap.color(for: element).cgColor
    }
}
