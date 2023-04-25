//
//  DesignedViewBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

public struct DesignedViewBehaviour {
    // MARK: - Data
    private var internalViewParameters = InternalDesignedViewParameters()
    private var viewParameters = DesignedViewParameters.makeDefault()
    
    // MARK: - Interface methods
    func layoutSubviews(view: UIView) {
        internalViewParameters.cornerRadius?.apply(to: view)
        internalViewParameters.shadow?.apply(to: view)
    }
    
    func traitCollectionDidChange(view: UIView) {
        internalViewParameters.backgroundColor?.apply(to: view)
        internalViewParameters.border?.apply(to: view)
        internalViewParameters.shadow?.apply(to: view)
    }
    
    mutating func addParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                                  with value: T,
                                  for view: UIView) {
        viewParameters[keyPath: parameter] = value
        switch parameter {
        case \.border:
            let border = DesignedViewBorder(border: viewParameters.border)
            internalViewParameters.border = border
            border.apply(to: view)
            
        case \.backgroundColor:
            let backgroundColor = DesignedViewBackgroundColor(value: viewParameters.backgroundColor)
            internalViewParameters.backgroundColor = backgroundColor
            backgroundColor.apply(to: view)
            
        case \.cornerRadius:
            let cornerRadius = DesignedViewCornerRadius(value: viewParameters.cornerRadius)
            internalViewParameters.cornerRadius = cornerRadius
            cornerRadius.apply(to: view)
            
        case \.shadow:
            guard let shadow = viewParameters.shadow else {
                return
            }
            let shadowModel = DesignedViewShadow(value: shadow)
            internalViewParameters.shadow = shadowModel
            shadowModel.apply(to: view)
            
        default:
            fatalError("Describe New Type binding")
        }
    }
}
