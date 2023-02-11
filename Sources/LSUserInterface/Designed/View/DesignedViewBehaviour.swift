//
//  DesignedViewBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

struct DesignedViewBehaviour {
    var internalViewParameters = InternalDesignedViewParameters()
    var viewParameters = DesignedViewParameters.makeDefault()
    
    func layoutSubviews(view: UIView) {
        internalViewParameters.cornerRadius?.apply(to: view)
    }
    
    func traitCollectionDidChange(view: UIView) {
        internalViewParameters.backgroundColor?.apply(to: view)
        internalViewParameters.border?.apply(to: view)
    }
    
    mutating func addParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                                  with value: T,
                                  for view: UIView) {
        viewParameters[keyPath: parameter] = value
        switch parameter {
        case \.border:
            let border = DesignedViewBorder(width: viewParameters.border.0,
                                            colorMap: viewParameters.border.1)
            internalViewParameters.border = border
            border.apply(to: view)
        case \.backgroundColor:
            let backgroundColor = DesignedViewBackgroundColor(colorMap: viewParameters.backgroundColor)
            internalViewParameters.backgroundColor = backgroundColor
            backgroundColor.apply(to: view)
        case \.cornerRadius:
            let cornerRadius = DesignedViewCornerRadius(value: viewParameters.cornerRadius)
            internalViewParameters.cornerRadius = cornerRadius
            cornerRadius.apply(to: view)
        default:
            fatalError("Describe New Type binding")
        }
    }
}
