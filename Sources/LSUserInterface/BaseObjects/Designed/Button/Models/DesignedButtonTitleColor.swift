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

public struct DesignedButtonTitleColor: DesignedButtonParameter, DesignedButtonParameterApplyable {
    // MARK: - Data
    private var titleColor: ColorMap
    
    // MARK: - Life cycle
    init(titleColor: ColorMap) {
        self.titleColor = titleColor
    }
    
    // MARK: - DesignedButtonParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedButtonParameterApplyable
    func apply(to button: UIButton) {
        button.setTitleColor(titleColor.color(for: button), for: .normal)
    }
}
