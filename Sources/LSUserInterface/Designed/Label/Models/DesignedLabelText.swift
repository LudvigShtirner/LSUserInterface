//
//  DesignedLabelText.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelText: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let text: String
    
    // MARK: - Life cycle
    init(text: String) {
        self.text = text
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = String
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UILabel
    func apply(to element: Element) {
        element.text = text
    }
}
