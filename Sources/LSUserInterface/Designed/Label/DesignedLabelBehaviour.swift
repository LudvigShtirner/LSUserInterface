//
//  DesignedLabelBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

struct DesignedLabelBehaviour {
    // MARK: - Data
    var internalLabelParameters = InternalDesignedLabelParameters()
    var labelParameters = DesignedLabelParameters(textColor: .init(color: .black),
                                                  font: .systemFont(ofSize: 14.0),
                                                  numberOfLines: .restricted(1),
                                                  text: "",
                                                  textAlignment: .left)
    
    // MARK: - Interface methods
    func traitCollectionDidChange(label: UILabel) {
        internalLabelParameters.textColor?.apply(to: label)
    }
    
    mutating func addParameter<T>(_ parameter: WritableKeyPath<DesignedLabelParameters, T>,
                                  with value: T,
                                  for label: UILabel) {
        labelParameters[keyPath: parameter] = value
        switch parameter {
        case \.textColor:
            let textColor = DesignedLabelTextColor(textColor: labelParameters.textColor)
            internalLabelParameters.textColor = textColor
            textColor.apply(to: label)
        case \.font:
            let font = DesignedLabelFont(font: labelParameters.font)
            font.apply(to: label)
        case \.numberOfLines:
            let numOfLines = DesignedLabelNumberOfLines(numberOfLines: labelParameters.numberOfLines)
            numOfLines.apply(to: label)
        case \.text:
            let text = DesignedLabelText(text: labelParameters.text)
            text.apply(to: label)
        case \.textAlignment:
            let alignment = DesignedLabelTextAlignment(textAlignment: labelParameters.textAlignment)
            alignment.apply(to: label)
        default:
            fatalError("Describe New Type binding")
        }
    }
}
