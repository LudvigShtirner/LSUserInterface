//
//  DesignedLabelTextColor.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct DesignedLabelTextColor: DesignedLabelParameter, DesignedLabelParameterApplyable {
    // MARK: - Data
    private let textColor: ColorMap
    
    // MARK: - Life cycle
    init(textColor: ColorMap) {
        self.textColor = textColor
    }
    
    // MARK: - DesignedLabelParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedLabelParameterApplyable
    func apply(to label: UILabel) {
        label.textColor = textColor.color(for: label)
    }
}
