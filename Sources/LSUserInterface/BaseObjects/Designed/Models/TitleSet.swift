//
//  File.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct TitleSet {
    let normalText: String
    let highlightText: String?
    let disabledText: String?
    let font: UIFont
    let numberOfLines: NumberOfLines
    
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
