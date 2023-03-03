//
//  DesignedLabel.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

open class DesignedLabel: UILabel, DesignedViewInterface, DesignedElementInsertable {
    // MARK: - Data
    public var viewBehaviour = DesignedViewBehaviour()
    private var labelBehaviour = DesignedLabelBehaviour()
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBehaviour.layoutSubviews(view: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        viewBehaviour.traitCollectionDidChange(view: self)
        labelBehaviour.traitCollectionDidChange(label: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedLabelParameters, T>,
                                with value: T) -> Self {
        labelBehaviour.addParameter(parameter,
                                    with: value,
                                    for: self)
        return self
    }
}
