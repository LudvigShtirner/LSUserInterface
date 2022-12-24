//
//  DesignedButtonConfigurator.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

protocol DesignedButtonConfigurator: UIButton {
    var internalButtonParameters: InternalDesignedButtonParameters { get set }
    var buttonParameters: DesignedButtonParameters { get set }
    
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedButtonParameters, T>, with value: T) -> Self
}

extension DesignedButtonConfigurator {
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedButtonParameters, T>, with value: T) -> Self {
        buttonParameters[keyPath: parameter] = value
        switch parameter {
        case \.tintColor:
            let tintColor = DesignedButtonTintColor(colorMap: buttonParameters.tintColor)
            internalButtonParameters.tintColor = tintColor
            tintColor.apply(to: self)
        case \.imageSet:
            let imageSet = DesignedButtonImageSet(imageSet: buttonParameters.imageSet)
            imageSet.apply(to: self)
        case \.titleSet:
            let titleSet = DesignedButtonTitleSet(titleSet: buttonParameters.titleSet)
            titleSet.apply(to: self)
        case \.titleColor:
            let titleColor = DesignedButtonTitleColor(titleColor: buttonParameters.titleColor)
            internalButtonParameters.titleColor = titleColor
            titleColor.apply(to: self)
        default:
            fatalError("Describe New Type binding")
        }
        return self
    }
}
