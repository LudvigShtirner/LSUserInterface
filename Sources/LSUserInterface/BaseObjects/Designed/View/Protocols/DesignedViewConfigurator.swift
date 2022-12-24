//
//  DesignedViewConfigurator.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

protocol DesignedViewConfigurator: UIView {
    var internalViewParameters: InternalDesignedViewParameters { get set }
    var viewParameters: DesignedViewParameters { get set }
    
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>, with value: T) -> Self
}

extension DesignedViewConfigurator {
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>, with value: T) -> Self {
        viewParameters[keyPath: parameter] = value
        switch parameter {
        case \.border:
            let border = DesignedViewBorder(width: viewParameters.border.0,
                                            colorMap: viewParameters.border.1)
            internalViewParameters.border = border
            border.apply(to: self)
        case \.backgroundColor:
            let backgroundColor = DesignedViewBackgroundColor(colorMap: viewParameters.backgroundColor)
            internalViewParameters.backgroundColor = backgroundColor
            backgroundColor.apply(to: self)
        case \.cornerRadius:
            let cornerRadius = DesignedViewCornerRadius(value: viewParameters.cornerRadius)
            internalViewParameters.cornerRadius = cornerRadius
            cornerRadius.apply(to: self)
        default:
            fatalError("Describe New Type binding")
        }
        return self
    }
}
