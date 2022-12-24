//
//  DesignedLabelFont.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

/// <#Description#>
public struct DesignedLabelFont: DesignedLabelParameter, DesignedLabelParameterApplyable {
    // MARK: - Data
    private let font: UIFont
    
    // MARK: - Life cycle
    init(font: UIFont) {
        self.font = font
    }
    
    // MARK: - DesignedLabelParameter
    public typealias Parameter = UIFont
    
    // MARK: - DesignedLabelParameterApplyable
    func apply(to label: UILabel) {
        label.font = font
    }
}
