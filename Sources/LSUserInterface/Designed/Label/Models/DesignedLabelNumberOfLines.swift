//
//  DesignedLabelNumberOfLines.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelNumberOfLines: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let numberOfLines: NumberOfLines
    
    // MARK: - Life cycle
    init(numberOfLines: NumberOfLines) {
        self.numberOfLines = numberOfLines
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = NumberOfLines
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UILabel
    func apply(to element: Element) {
        element.numberOfLines = numberOfLines.value
    }
}
