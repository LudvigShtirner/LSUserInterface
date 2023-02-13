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
    var buttonParameters = DesignedButtonParameters(tintColor: .init(color: .clear),
                                                    titleColor: .init(normal: .init(color: .clear)),
                                                    imageSet: .init(normalImage: .add),
                                                    titleSet: .init(normalText: ""),
                                                    font: .systemFont(ofSize: 14.0))
    
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
            let imageSet = DesignedButtonImageSet(imageSet: buttonParameters.imageSet)
            imageSet.apply(to: button)
        case \.titleSet:
            let titleSet = DesignedButtonTitleSet(titleSet: buttonParameters.titleSet)
            titleSet.apply(to: button)
        case \.titleColor:
            let titleColor = DesignedButtonTitleColor(titleColorSet: buttonParameters.titleColor)
            internalButtonParameters.titleColor = titleColor
            titleColor.apply(to: button)
        case \.font:
            let font = DesignedButtonTitleFont(font: buttonParameters.font)
            font.apply(to: button)
        default:
            fatalError("Describe New Type binding")
        }
    }
}
