//
//  DesignedView.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

open class DesignedView: BaseView, DesignedViewConfigurator {
    // MARK: - DesignedViewConfigurable
    var internalViewParameters = InternalBaseDesignedViewParameters()
    var viewParameters = DesignedViewParameters.makeDefault()
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        internalViewParameters.cornerRadius?.apply(to: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        internalViewParameters.backgroundColor?.apply(to: self)
        internalViewParameters.border?.apply(to: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>, with value: T) -> Self {
        addParameter(parameter, with: value)
    }
}
