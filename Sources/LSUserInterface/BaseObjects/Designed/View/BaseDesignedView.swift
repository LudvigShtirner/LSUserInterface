//
//  BaseDesignedView.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

open class BaseDesignedView: BaseView {
    // MARK: - Data
    private var parameters = InternalBaseDesignedViewParameters()
    private var eParameters = BaseDesignedViewParameters(cornerRadius: .zero,
                                                         backgroundColor: .init(color: .clear),
                                                         border: (.zero, .init(color: .clear)))
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        parameters.cornerRadius?.apply(to: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        parameters.backgroundColor?.apply(to: self)
        parameters.border?.apply(to: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func addParameter<T>(_ parameter: WritableKeyPath<BaseDesignedViewParameters, T>, with value: T) -> Self {
        eParameters[keyPath: parameter] = value
        switch parameter {
        case \.border:
            let border = Border(width: eParameters.border.0,
                                colorMap: eParameters.border.1)
            parameters.border = border
            border.apply(to: self)
        case \.backgroundColor:
            let backgroundColor = BackgroundColor(colorMap: eParameters.backgroundColor)
            parameters.backgroundColor = backgroundColor
            backgroundColor.apply(to: self)
        case \.cornerRadius:
            let cornerRadius = CornerRadius(value: eParameters.cornerRadius)
            parameters.cornerRadius = cornerRadius
            cornerRadius.apply(to: self)
        default:
            fatalError("Describe New Type binding")
        }
        return self
    }
}
