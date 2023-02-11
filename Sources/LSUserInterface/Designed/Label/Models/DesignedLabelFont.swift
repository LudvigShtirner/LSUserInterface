//
//  DesignedLabelFont.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

/// <#Description#>
public struct DesignedLabelFont: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let font: UIFont
    
    // MARK: - Life cycle
    init(font: UIFont) {
        self.font = font
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = UIFont
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UILabel
    func apply(to element: Element) {
        element.font = font
    }
}
