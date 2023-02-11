//
//  DesignedLabelTextAlignment.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelTextAlignment: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let textAlignment: Parameter
    
    // MARK: - Life Cycle
    init(textAlignment: Parameter) {
        self.textAlignment = textAlignment
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = NSTextAlignment
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UILabel
    func apply(to element: Element) {
        element.textAlignment = textAlignment
    }
}
