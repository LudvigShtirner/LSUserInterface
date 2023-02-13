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
    private var titleColorSet: TitleColorSet
    
    // MARK: - Life cycle
    init(titleColorSet: TitleColorSet) {
        self.titleColorSet = titleColorSet
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = TitleColorSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.setTitleColor(titleColorSet.normal.color(for: element), for: .normal)
        element.setTitleColor(titleColorSet.highlighted?.color(for: element), for: .highlighted)
        element.setTitleColor(titleColorSet.disabled?.color(for: element), for: .disabled)
    }
}
