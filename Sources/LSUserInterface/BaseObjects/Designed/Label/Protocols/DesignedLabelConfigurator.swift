//
//  DesignedLabelConfigurator.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

protocol DesignedLabelConfigurator: UILabel {
    var internalLabelParameters: InternalDesignedLabelParameters { get set }
    var labelParameters: DesignedLabelParameters { get set }
    
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedLabelParameters, T>, with value: T) -> Self
}

extension DesignedLabelConfigurator {
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedLabelParameters, T>, with value: T) -> Self {
        labelParameters[keyPath: parameter] = value
        switch parameter {
        case \.textColor:
            let textColor = DesignedLabelTextColor(textColor: labelParameters.textColor)
            internalLabelParameters.textColor = textColor
            textColor.apply(to: self)
        case \.font:
            let font = DesignedLabelFont(font: labelParameters.font)
            font.apply(to: self)
        case \.numberOfLines:
            let numOfLines = DesignedLabelNumberOfLines(numberOfLines: labelParameters.numberOfLines)
            numOfLines.apply(to: self)
        case \.text:
            let text = DesignedLabelText(text: labelParameters.text)
            text.apply(to: self)
        default:
            fatalError("Describe New Type binding")
        }
        return self
    }
}
