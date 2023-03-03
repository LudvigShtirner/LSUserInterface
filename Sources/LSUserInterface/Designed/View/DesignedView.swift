//
//  DesignedView.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

open class DesignedView: BaseView, DesignedViewInterface, DesignedElementInsertable {
    // MARK: - DesignedViewInterface
    public var viewBehaviour = DesignedViewBehaviour()
    
    // MARK: - Overrides
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBehaviour.layoutSubviews(view: self)
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        viewBehaviour.traitCollectionDidChange(view: self)
    }
}

public protocol DesignedViewInterface: UIView {
    var viewBehaviour: DesignedViewBehaviour { get set }
    
    @discardableResult
    func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                         with value: T) -> Self
}

public extension DesignedViewInterface {
    @discardableResult
    func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                         with value: T) -> Self {
        viewBehaviour.addParameter(parameter,
                                   with: value,
                                   for: self)
        return self
    }
}
