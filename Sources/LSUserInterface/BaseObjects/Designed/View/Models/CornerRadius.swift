//
//  CornerRadius.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import CoreGraphics

/// Свойство скругления ототбражения
struct CornerRadius: BaseDesignedViewParameter {
    // MARK: - Data
    private var value: CGFloat
    
    // MARK: - Life cycle
    init(value: CGFloat) {
        self.value = value
    }
    
    // MARK: - BaseDesignedViewParameter
    typealias Parameter = CGFloat
    
    public func apply(to view: BaseDesignedView) {
        view.layer.cornerRadius = value
    }
}
