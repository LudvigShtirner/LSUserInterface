//
//  DesignedButtonTintColor.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct DesignedButtonTintColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(colorMap: ColorMap) {
        self.colorMap = colorMap
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.tintColor = colorMap.color(for: element)
    }
}
