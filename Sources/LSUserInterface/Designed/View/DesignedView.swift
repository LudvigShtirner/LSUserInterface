//
//  DesignedView.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

open class DesignedView: BaseView, DesignedViewInterfaceInternal {
    // MARK: - DesignedViewInterface
    var hitTestDecorator: DesignedViewHitTestDecorator?
    var lsCornerRadius: DesignedViewCornerRadius?
    var lsBackgroundColor: DesignedViewBackgroundColor?
    var lsBorder: DesignedViewBorder?
    var lsShadow: DesignedViewShadow?
    
    // MARK: - Inits
    public init() {
        super.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
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
    }
}
