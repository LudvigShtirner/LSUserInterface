//
//  DesignedButtonTitleSet.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

public struct DesignedButtonTitleSet: DesignedButtonParameter, DesignedButtonParameterApplyable {
    // MARK: - Data
    private var titleSet: TitleSet
    
    // MARK: - Life cycle
    init(titleSet: TitleSet) {
        self.titleSet = titleSet
    }
    
    // MARK: - DesignedButtonParameter
    public typealias Parameter = TitleSet
    
    // MARK: - DesignedButtonParameterApplyable
    func apply(to button: UIButton) {
        button.setTitle(titleSet.normalText, for: .normal)
        button.setTitle(titleSet.highlightText, for: .highlighted)
        button.setTitle(titleSet.disabledText, for: .disabled)
        button.titleLabel?.font = titleSet.font
        button.titleLabel?.numberOfLines = titleSet.numberOfLines.value
    }
}
