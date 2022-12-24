//
//  DesignedLabelText.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelText: DesignedLabelParameter, DesignedLabelParameterApplyable {
    // MARK: - Data
    private let text: String
    
    // MARK: - Life cycle
    init(text: String) {
        self.text = text
    }
    
    // MARK: - DesignedLabelParameter
    public typealias Parameter = String
    
    // MARK: - DesignedLabelParameterApplyable
    func apply(to label: UILabel) {
        label.text = text
    }
}
