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

public struct DesignedButtonTintColor: DesignedButtonParameter, DesignedButtonParameterApplyable {
    // MARK: - Data
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(colorMap: ColorMap) {
        self.colorMap = colorMap
    }
    
    // MARK: - DesignedButtonParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedButtonParameterApplyable
    func apply(to button: UIButton) {
        button.tintColor = colorMap.color(for: button)
    }
}
