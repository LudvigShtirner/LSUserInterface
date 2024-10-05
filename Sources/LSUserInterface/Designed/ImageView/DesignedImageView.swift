//
//  DesignedImageView.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

open class DesignedImageView: UIImageView, DesignedViewInterfaceInternal, DesignedImageViewInterfaceInternal {
    // MARK: - DesignedImageViewInterfaceInternal
    var lsTintColor: DesignedImageViewTintColor?
    
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
        lsTintColor?.apply(to: self)
    }
}
