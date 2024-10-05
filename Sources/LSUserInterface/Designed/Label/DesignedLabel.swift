//
//  DesignedLabel.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

open class DesignedLabel: UILabel, DesignedViewInterfaceInternal, DesignedLabelInterfaceInternal {
    // MARK: - DesignedLabelInterfaceInternal
    var lsTextColor: DesignedLabelTextColor?
    
    // MARK: - DesignedViewInterfaceInternal
    public var hitTestDecorator: DesignedViewHitTestDecorator?
    var lsCornerRadius: DesignedViewCornerRadius?
    var lsBackgroundColor: DesignedViewBackgroundColor?
    var lsBorder: DesignedViewBorder?
    var lsShadow: DesignedViewShadow?
    
    // MARK: - Overrides
    open override func hitTest(_ point: CGPoint,
                               with event: UIEvent?) -> UIView? {
        guard let decorator = hitTestDecorator else {
            return super.hitTest(point, with: event)
        }
        return decorator.hitTest(point, with: event)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        lsCornerRadius?.apply(to: self)
        lsShadow?.apply(to: self)
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        lsBackgroundColor?.apply(to: self)
        lsBorder?.apply(to: self)
        lsShadow?.apply(to: self)
        lsTextColor?.apply(to: self)
    }
}
