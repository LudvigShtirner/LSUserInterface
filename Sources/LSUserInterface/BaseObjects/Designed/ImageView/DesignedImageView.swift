//
//  DesignedImageView.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

open class DesignedImageView: UIImageView, DesignedViewConfigurator, DesignedImageViewConfigurator {
    // MARK: - DesignedViewConfigurable
    var internalViewParameters = InternalDesignedViewParameters()
    var viewParameters = DesignedViewParameters.makeDefault()
    
    // MARK: - DesignedImageViewConfigurator
    var internalImageViewParameters = InternalDesignedImageViewParameters()
    var imageViewParameters = DesignedImageViewParameters(image: .checkmark,
                                                          tintColor: .init(color: .black),
                                                          contentMode: .scaleToFill)
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        internalViewParameters.cornerRadius?.apply(to: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        internalImageViewParameters.tintColor?.apply(to: self)
        
        internalViewParameters.backgroundColor?.apply(to: self)
        internalViewParameters.border?.apply(to: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>, with value: T) -> Self {
        addParameter(parameter, with: value)
    }
    
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedImageViewParameters, T>, with value: T) -> Self {
        addParameter(parameter, with: value)
    }
}
