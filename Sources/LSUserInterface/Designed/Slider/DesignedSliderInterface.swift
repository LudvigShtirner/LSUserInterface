//
//  DesignedSliderInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedSliderInterface: UISlider {
    @discardableResult
    func usingSliderDrawer(_ sliderDrawer: DesignedSliderDrawer) -> Self
    @discardableResult
    func usingTrackingEventHandler(_ trackingEventHandler: DesignedSliderTrackingEventHandler) -> Self
    @discardableResult
    func usingLayoutSubviewsDecorator(_ layoutSubviewsDecorator: DesignedSliderLayoutSubviewsDecorator) -> Self
    @discardableResult
    func usingThumbRectDecorator(_ thumbRectDecorator: DesignedSliderThumbRectDecorator) -> Self
    
    @discardableResult
    func usingThumbImage(_ thumbImage: ImageSet) -> Self
    @discardableResult
    func usingMinimumTrackColors(_ minimumColors: ColorSet) -> Self
    @discardableResult
    func usingMaximumTrackColors(_ maximumColors: ColorSet) -> Self
    
    @discardableResult
    func usingMinimumValue(_ minimumValue: Float) -> Self
    @discardableResult
    func usingMaximumValue(_ maximumValue: Float) -> Self
}

protocol DesignedSliderInterfaceInternal: DesignedSliderInterface {
    var sliderDrawer: DesignedSliderDrawer? { get set }
    var trackingEventHandler: DesignedSliderTrackingEventHandler? { get set }
    var layoutSubviewsDecorator: DesignedSliderLayoutSubviewsDecorator? { get set }
    var thumbRectDecorator: DesignedSliderThumbRectDecorator? { get set }
    
    var thumbImages: DesignedSliderThumbImage? { get set }
    var minimumTrackColors: DesignedSliderMinimumTrackColor? { get set }
    var maximumTrackColors: DesignedSliderMaximumTrackColor? { get set }
}

extension DesignedSliderInterfaceInternal {
    @discardableResult
    public func usingSliderDrawer(_ sliderDrawer: DesignedSliderDrawer) -> Self {
        self.sliderDrawer = sliderDrawer
        return self
    }
    
    @discardableResult
    public func usingTrackingEventHandler(_ trackingEventHandler: DesignedSliderTrackingEventHandler) -> Self {
        self.trackingEventHandler = trackingEventHandler
        return self
    }
    
    @discardableResult
    public func usingLayoutSubviewsDecorator(_ layoutSubviewsDecorator: DesignedSliderLayoutSubviewsDecorator) -> Self {
        self.layoutSubviewsDecorator = layoutSubviewsDecorator
        return self
    }
    
    @discardableResult
    public func usingThumbRectDecorator(_ thumbRectDecorator: DesignedSliderThumbRectDecorator) -> Self {
        self.thumbRectDecorator = thumbRectDecorator
        return self
    }
    
    @discardableResult
    public func usingThumbImage(_ thumbImage: ImageSet) -> Self {
        self.thumbImages = DesignedSliderThumbImage(thumbImage: thumbImage)
        self.thumbImages?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingMinimumTrackColors(_ minimumColors: ColorSet) -> Self {
        self.minimumTrackColors = DesignedSliderMinimumTrackColor(colorSet: minimumColors)
        self.minimumTrackColors?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingMaximumTrackColors(_ maximumColors: ColorSet) -> Self {
        self.maximumTrackColors = DesignedSliderMaximumTrackColor(colorSet: maximumColors)
        self.maximumTrackColors?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingMinimumValue(_ minimumValue: Float) -> Self {
        self.minimumValue = minimumValue
        return self
    }
    
    @discardableResult
    public func usingMaximumValue(_ maximumValue: Float) -> Self {
        self.maximumValue = maximumValue
        return self
    }
}
