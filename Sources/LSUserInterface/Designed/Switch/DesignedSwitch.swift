//
//  DesignedSwitch.swift
//  
//
//  Created by Алексей Филиппов on 21.02.2023.
//

// Apple
import UIKit

open class DesignedSwitch: BaseSwitch, DesignedViewInterfaceInternal, DesignedSwitchInterfaceInternal {
    // MARK: - DesignedViewInterfaceInternal
    public var hitTestDecorator: DesignedViewHitTestDecorator?
    var lsCornerRadius: DesignedViewCornerRadius?
    var lsBackgroundColor: DesignedViewBackgroundColor?
    var lsBorder: DesignedViewBorder?
    var lsShadow: DesignedViewShadow?
    
    // MARK: - DesignedSwitchInterfaceInternal
    var onColor: DesignedSwitchOnColor?
    
    // MARK: - Overrides
    open override func hitTest(_ point: CGPoint,
                               with event: UIEvent?) -> UIView? {
        guard let decorator = hitTestDecorator else {
            return super.hitTest(point, with: event)
        }
        return decorator.hitTest(point, with: event)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        lsCornerRadius?.apply(to: self)
        lsShadow?.apply(to: self)
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        lsBackgroundColor?.apply(to: self)
        lsBorder?.apply(to: self)
        lsShadow?.apply(to: self)
        onColor?.apply(to: self)
    }
}
