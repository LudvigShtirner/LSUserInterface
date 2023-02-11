//
//  DesignedButtonTitleSet.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

public struct DesignedButtonTitleSet: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private var titleSet: TitleSet
    
    // MARK: - Life cycle
    init(titleSet: TitleSet) {
        self.titleSet = titleSet
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = TitleSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.setTitle(titleSet.normalText, for: .normal)
        element.setTitle(titleSet.highlightText, for: .highlighted)
        element.setTitle(titleSet.disabledText, for: .disabled)
        element.titleLabel?.font = titleSet.font
        element.titleLabel?.numberOfLines = titleSet.numberOfLines.value
    }
}
