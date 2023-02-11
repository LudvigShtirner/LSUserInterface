//
//  DesignedImageView.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

open class DesignedImageView: UIImageView {
    // MARK: - Data
    private var viewBehaviour = DesignedViewBehaviour()
    private var imageViewBehaviour = DesignedImageViewBehaviour()
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBehaviour.layoutSubviews(view: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        viewBehaviour.traitCollectionDidChange(view: self)
        imageViewBehaviour.traitCollectionDidChange(imageView: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                                with value: T) -> Self {
        viewBehaviour.addParameter(parameter,
                                   with: value,
                                   for: self)
        return self
    }
    
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedImageViewParameters, T>,
                                with value: T) -> Self {
        imageViewBehaviour.addParameter(parameter,
                                        with: value,
                                        for: self)
        return self
    }
}
