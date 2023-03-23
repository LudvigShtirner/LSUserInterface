//
//  DesignedViewBorder.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

/// Свойство границы отображения
public struct DesignedViewBorder: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let border: Border
    
    // MARK: - Life cycle
    init(border: Border) {
        self.border = border
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = Border
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIView
    func apply(to element: Element) {
        element.layer.borderWidth = border.width
        element.layer.borderColor = border.colorMap.color(for: element).cgColor
    }
}
