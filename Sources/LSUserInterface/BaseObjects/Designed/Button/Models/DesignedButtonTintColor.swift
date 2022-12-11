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

struct DesignedButtonTintColor: DesignedButtonParameter {
    // MARK: - Data
    private var colorMap: ColorMap
    
    // MARK: - Life cycle
    init(colorMap: ColorMap) {
        self.colorMap = colorMap
    }
    
    // MARK: - DesignedButtonParameter
    typealias Parameter = ColorMap
    
    func apply(to button: UIButton) {
        button.tintColor = colorMap.color(for: button)
    }
}
