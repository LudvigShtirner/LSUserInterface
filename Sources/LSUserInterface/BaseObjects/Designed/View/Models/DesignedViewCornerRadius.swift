//
//  DesignedViewCornerRadius.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

/// Свойство скругления ототбражения
struct DesignedViewCornerRadius: DesignedViewParameter {
    // MARK: - Data
    private var value: CGFloat
    
    // MARK: - Life cycle
    init(value: CGFloat) {
        self.value = value
    }
    
    // MARK: - BaseDesignedViewParameter
    typealias Parameter = CGFloat
    
    public func apply(to view: UIView) {
        view.layer.cornerRadius = value
    }
}
