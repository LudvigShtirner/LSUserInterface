//
//  DesignedButton.swift
//  
//
//  Created by Алексей Филиппов on 11.12.2022.
//

import UIKit

open class DesignedButton: BaseButton, DesignedViewConfigurator, DesignedButtonConfigurator {
    // MARK: - DesignedButtonConfigurator
    var internalButtonParameters = InternalDesignedButtonParameters()
    var buttonParameters = DesignedButtonParameters(tintColor: .init(color: .clear),
                                                    titleColor: .init(color: .clear),
                                                    imageSet: .init(normalImage: .add),
                                                    titleSet: .init(normalText: "", font: .systemFont(ofSize: 14.0)))
    
    // MARK: - DesignedViewConfigurable
    var internalViewParameters = InternalDesignedViewParameters()
    var viewParameters = DesignedViewParameters.makeDefault()
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        internalViewParameters.cornerRadius?.apply(to: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        internalButtonParameters.tintColor?.apply(to: self)
        internalButtonParameters.titleColor?.apply(to: self)
        
        internalViewParameters.backgroundColor?.apply(to: self)
        internalViewParameters.border?.apply(to: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedButtonParameters, T>, with value: T) -> Self {
        addParameter(parameter, with: value)
    }
    
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>, with value: T) -> Self {
        addParameter(parameter, with: value)
    }
}
