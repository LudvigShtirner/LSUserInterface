//
//  DesignedButton.swift
//  
//
//  Created by Алексей Филиппов on 11.12.2022.
//

import UIKit

open class DesignedButton: BaseButton {
    // MARK: - Data
    private var viewBehaviour = DesignedViewBehaviour()
    private var buttonBehaviour = DesignedButtonBehaviour()
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBehaviour.layoutSubviews(view: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        buttonBehaviour.traitCollectionDidChange(button: self)
        viewBehaviour.traitCollectionDidChange(view: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedButtonParameters, T>,
                                with value: T) -> Self {
        buttonBehaviour.addParameter(parameter,
                                     with: value,
                                     for: self)
        return self
    }
    
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>, with value: T) -> Self {
        viewBehaviour.addParameter(parameter,
                                   with: value,
                                   for: self)
        return self
    }
}
