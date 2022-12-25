//
//  DesignedLabelTextAlignment.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelTextAlignment: DesignedLabelParameter, DesignedLabelParameterApplyable {
    // MARK: - Data
    private let textAlignment: Parameter
    
    // MARK: - Life Cycle
    init(textAlignment: Parameter) {
        self.textAlignment = textAlignment
    }
    
    // MARK: - DesignedLabelParameter
    public typealias Parameter = NSTextAlignment
    
    // MARK: - DesignedLabelParameterApplyable
    func apply(to label: UILabel) {
        label.textAlignment = textAlignment
    }
}
