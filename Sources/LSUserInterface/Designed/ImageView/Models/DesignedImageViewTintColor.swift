//
//  DesignedImageViewTintColor.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct DesignedImageViewTintColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let tintColor: ColorMap
    
    // MARK: - Life Cycle
    init(tintColor: ColorMap) {
        self.tintColor = tintColor
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIImageView
    func apply(to element: Element) {
        element.tintColor = tintColor.color(for: element)
    }
}
