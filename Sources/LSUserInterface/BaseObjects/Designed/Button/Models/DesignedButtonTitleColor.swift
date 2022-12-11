//
//  DesignedButtonTitleColor.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

struct DesignedButtonTitleColor: DesignedButtonParameter {
    // MARK: - Data
    var titleColor: ColorMap
    
    // MARK: - Life cycle
    init(titleColor: ColorMap) {
        self.titleColor = titleColor
    }
    
    // MARK: - DesignedButtonParameter
    typealias Parameter = ColorMap
    func apply(to button: UIButton) {
        button.setTitleColor(titleColor.color(for: button), for: .normal)
    }
}
