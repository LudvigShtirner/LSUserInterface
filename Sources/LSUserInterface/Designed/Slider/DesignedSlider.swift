//
//  DesignedSlider.swift
//
//
//  Created by Алексей Филиппов on 07.01.2024.
//

// Apple
import UIKit

open class DesignedSlider: BaseSlider, DesignedViewInterfaceInternal, DesignedSliderInterfaceInternal {
    // MARK: - DesignedSliderInterfaceInternal
    var sliderDrawer: DesignedSliderDrawer?
    var trackingEventHandler: DesignedSliderTrackingEventHandler?
    var layoutSubviewsDecorator: DesignedSliderLayoutSubviewsDecorator?
    var thumbRectDecorator: DesignedSliderThumbRectDecorator?
    
    var thumbImages: DesignedSliderThumbImage?
    var minimumTrackColors: DesignedSliderMinimumTrackColor?
    var maximumTrackColors: DesignedSliderMaximumTrackColor?
    
    // MARK: - DesignedViewInterfaceInternal
    var hitTestDecorator: DesignedViewHitTestDecorator?
    var lsCornerRadius: DesignedViewCornerRadius?
    var lsBackgroundColor: DesignedViewBackgroundColor?
    var lsBorder: DesignedViewBorder?
    var lsShadow: DesignedViewShadow?
    
    // MARK: - Overrides
    open override var isHighlighted: Bool {
        didSet {
            minimumTrackColors?.apply(to: self)
            maximumTrackColors?.apply(to: self)
            thumbImages?.apply(to: self)
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            minimumTrackColors?.apply(to: self)
            maximumTrackColors?.apply(to: self)
            thumbImages?.apply(to: self)
        }
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        minimumTrackColors?.apply(to: self)
        maximumTrackColors?.apply(to: self)
        lsBackgroundColor?.apply(to: self)
        lsBorder?.apply(to: self)
        lsShadow?.apply(to: self)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        lsCornerRadius?.apply(to: self)
        lsShadow?.apply(to: self)
        layoutSubviewsDecorator?.handleLayoutSubviews()
    }
    
    open override func hitTest(_ point: CGPoint,
                               with event: UIEvent?) -> UIView? {
        guard let decorator = hitTestDecorator else {
            return super.hitTest(point, with: event)
        }
        return decorator.hitTest(point, with: event)
    }
    
    open override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext(),
                let drawer = sliderDrawer else {
            super.draw(rect)
            return
        }
        _ = drawer.drawSlider(self,
                              rect: rect,
                              context: context)
    }
    
    open override func thumbRect(forBounds bounds: CGRect,
                                 trackRect rect: CGRect,
                                 value: Float) -> CGRect {
        let superAnswer = super.thumbRect(forBounds: bounds,
                                          trackRect: rect,
                                          value: value)
        guard let thumbRectDecorator else {
            return superAnswer
        }
        return thumbRectDecorator.thumbRect(forBounds: bounds,
                                            trackRect: rect,
                                            value: value,
                                            slider: self,
                                            superAnswer: superAnswer)
    }
    
    open override func beginTracking(_ touch: UITouch,
                                     with event: UIEvent?) -> Bool {
        trackingEventHandler?.beginTracking(touch,
                                            with: event,
                                            on: self)
        continueTracking(touch, with: event)
        return true
    }
    
    open override func endTracking(_ touch: UITouch?, 
                                   with event: UIEvent?) {
        trackingEventHandler?.endTracking(touch,
                                          with: event,
                                          on: self)
    }
}
