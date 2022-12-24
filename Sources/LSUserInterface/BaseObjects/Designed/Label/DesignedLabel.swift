//
//  DesignedLabel.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

open class DesignedLabel: UILabel, DesignedViewConfigurator, DesignedLabelConfigurator {
    // MARK: - DesignedViewConfigurable
    var internalViewParameters = InternalDesignedViewParameters()
    var viewParameters = DesignedViewParameters.makeDefault()
    
    // MARK: - DesignedLabelConfigurator
    var internalLabelParameters = InternalDesignedLabelParameters()
    var labelParameters = DesignedLabelParameters(textColor: .init(color: .black),
                                                  font: .systemFont(ofSize: 14.0),
                                                  numberOfLines: .restricted(1),
                                                  text: "")
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        internalViewParameters.cornerRadius?.apply(to: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        internalLabelParameters.textColor?.apply(to: self)
        
        internalViewParameters.backgroundColor?.apply(to: self)
        internalViewParameters.border?.apply(to: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>, with value: T) -> Self {
        addParameter(parameter, with: value)
    }
    
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedLabelParameters, T>, with value: T) -> Self {
        addParameter(parameter, with: value)
    }
}
