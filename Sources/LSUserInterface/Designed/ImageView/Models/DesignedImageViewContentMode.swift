//
//  DesignedImageViewContentMode.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedImageViewContentMode: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let contentMode: Parameter
    
    // MARK: - Life cycle
    init(contentMode: Parameter) {
        self.contentMode = contentMode
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = UIView.ContentMode
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIImageView
    func apply(to element: Element) {
        element.contentMode = contentMode
    }
}
