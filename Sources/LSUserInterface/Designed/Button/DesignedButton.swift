//
//  DesignedButton.swift
//  
//
//  Created by Алексей Филиппов on 11.12.2022.
//

import UIKit

open class DesignedButton: BaseButton, DesignedElementInsertable {
    // MARK: - Data
    private var buttonBehaviour = DesignedButtonBehaviour()
    
    // MARK: - Overrides
    open override var isHighlighted: Bool {
        didSet {
            buttonBehaviour.isHighlightedChanged(button: self)
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            buttonBehaviour.isEnabledChanged(button: self)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        buttonBehaviour.layoutSubviews(button: self)
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        buttonBehaviour.traitCollectionDidChange(button: self)
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
}
