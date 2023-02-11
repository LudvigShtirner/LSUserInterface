//
//  DesignedView.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

open class DesignedView: BaseView {
    // MARK: - DesignedViewConfigurable
    private var behaviour = DesignedViewBehaviour()
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        behaviour.layoutSubviews(view: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        behaviour.traitCollectionDidChange(view: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                                with value: T) -> Self {
        behaviour.addParameter(parameter,
                               with: value,
                               for: self)
        return self
    }
}
