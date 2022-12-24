//
//  DesignedViewCornerRadius.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

/// Свойство скругления ототбражения
public struct DesignedViewCornerRadius: DesignedViewParameter, DesignedViewParameterApplyable {
    // MARK: - Data
    private var value: CGFloat
    
    // MARK: - Life cycle
    init(value: CGFloat) {
        self.value = value
    }
    
    // MARK: - BaseDesignedViewParameter
    public typealias Parameter = CGFloat
    
    // MARK: - DesignedViewParameterApplyable
    func apply(to view: UIView) {
        view.layer.cornerRadius = value
    }
}
