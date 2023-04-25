//
//  DesignedButtonBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

struct DesignedButtonBehaviour {
    // MARK: - Data
    var internalButtonParameters = InternalDesignedButtonParameters()
    var buttonParameters = DesignedButtonParameters.makeDefault()
    
    // MARK: - Interface methods
    func isHighlightedChanged(button: UIButton) {
        internalButtonParameters.titleColor?.apply(to: button)
    }
    
    func isEnabledChanged(button: UIButton) {
        internalButtonParameters.titleColor?.apply(to: button)
    }
    
    func traitCollectionDidChange(button: UIButton) {
        internalButtonParameters.tintColor?.apply(to: button)
        internalButtonParameters.titleColor?.apply(to: button)
    }
    
    mutating func addParameter<T>(_ parameter: WritableKeyPath<DesignedButtonParameters, T>,
                                  with value: T,
                                  for button: UIButton) {
        buttonParameters[keyPath: parameter] = value
        switch parameter {
        case \.tintColor:
            let tintColor = DesignedButtonTintColor(colorMap: buttonParameters.tintColor)
            internalButtonParameters.tintColor = tintColor
            tintColor.apply(to: button)
        case \.imageSet:
            let imageSet = buttonParameters.imageSet
            button.setImage(imageSet.normalImage, for: .normal)
            button.setImage(imageSet.highlightImage, for: .highlighted)
            button.setImage(imageSet.disabledImage, for: .disabled)
        case \.titleSet:
            let titleSet = buttonParameters.titleSet
            button.setTitle(titleSet.normalText, for: .normal)
            button.setTitle(titleSet.highlightText, for: .highlighted)
            button.setTitle(titleSet.disabledText, for: .disabled)
        case \.numberOfLines:
            button.titleLabel?.numberOfLines = buttonParameters.numberOfLines.value
        case \.titleColor:
            let titleColor = DesignedButtonTitleColor(titleColorSet: buttonParameters.titleColor)
            internalButtonParameters.titleColor = titleColor
            titleColor.apply(to: button)
        case \.font:
            if button.titleLabel == nil {
                button.setTitle("", for: .normal)
            }
            button.titleLabel?.font = buttonParameters.font
        default:
            fatalError("Describe New Type binding")
        }
    }
}
