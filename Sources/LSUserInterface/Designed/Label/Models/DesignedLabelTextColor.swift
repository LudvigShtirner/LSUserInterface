//
//  DesignedLabelTextColor.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelTextColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let textColor: ColorMap
    
    // MARK: - Inits
    init(textColor: ColorMap) {
        self.textColor = textColor
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UILabel
    func apply(to element: Element) {
        element.textColor = textColor.color(for: element)
    }
}
