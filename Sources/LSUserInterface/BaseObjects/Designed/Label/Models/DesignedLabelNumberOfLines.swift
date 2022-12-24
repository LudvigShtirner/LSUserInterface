//
//  DesignedLabelNumberOfLines.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelNumberOfLines: DesignedLabelParameter, DesignedLabelParameterApplyable {
    // MARK: - Data
    private let numberOfLines: NumberOfLines
    
    // MARK: - Life cycle
    init(numberOfLines: NumberOfLines) {
        self.numberOfLines = numberOfLines
    }
    
    // MARK: - DesignedLabelParameter
    public typealias Parameter = NumberOfLines
    
    // MARK: - DesignedLabelParameterApplyable
    func apply(to label: UILabel) {
        label.numberOfLines = numberOfLines.value
    }
}
