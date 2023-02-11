//
//  DesignedButtonTitleColor.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct DesignedButtonTitleColor: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private var titleColor: ColorMap
    
    // MARK: - Life cycle
    init(titleColor: ColorMap) {
        self.titleColor = titleColor
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.setTitleColor(titleColor.color(for: element), for: .normal)
    }
}
