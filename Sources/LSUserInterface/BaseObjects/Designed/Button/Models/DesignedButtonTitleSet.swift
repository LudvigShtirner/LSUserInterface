//
//  DesignedButtonTitleSet.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

struct DesignedButtonTitleSet: DesignedButtonParameter {
    // MARK: - Data
    var titleSet: TitleSet
    
    // MARK: - Life cycle
    init(titleSet: TitleSet) {
        self.titleSet = titleSet
    }
    
    // MARK: - DesignedButtonParameter
    typealias Parameter = TitleSet
    func apply(to button: UIButton) {
        button.setTitle(titleSet.normalText, for: .normal)
        button.setTitle(titleSet.highlightText, for: .highlighted)
        button.setTitle(titleSet.disabledText, for: .disabled)
        button.titleLabel?.font = titleSet.font
        button.titleLabel?.numberOfLines = titleSet.numberOfLines.value
    }
}

public struct TitleSet {
    var normalText: String
    var highlightText: String?
    var disabledText: String?
    var font: UIFont
    var numberOfLines: NumberOfLines
    
    public init(normalText: String,
                highlightText: String? = nil,
                disabledText: String? = nil,
                font: UIFont,
                numberOfLines: NumberOfLines = .restricted(1)) {
        self.normalText = normalText
        self.highlightText = highlightText
        self.disabledText = disabledText
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

public enum NumberOfLines {
    case restricted(Int)
    case multiline
    
    var value: Int {
        switch self {
        case .restricted(let lines):
            return lines
        case .multiline:
            return 0
        }
    }
}
