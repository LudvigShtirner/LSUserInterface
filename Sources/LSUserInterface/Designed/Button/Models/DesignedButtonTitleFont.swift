//
//  DesignedButtonTitleFont.swift
//  
//
//  Created by Алексей Филиппов on 12.02.2023.
//

// Apple
import UIKit

public struct DesignedButtonTitleFont: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let font: UIFont
    
    // MARK: - Life cycle
    init(font: UIFont) {
        self.font = font
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = UIFont
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.titleLabel?.font = font
    }
}
