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
    func setSliderDrawer(_ sliderDrawer: DesignedSliderDrawer) -> Self
    @discardableResult
    func setTrackingEventHandler(_ trackingEventHandler: DesignedSliderTrackingEventHandler) -> Self
    @discardableResult
    func setLayoutSubviewsDecorator(_ layoutSubviewsDecorator: DesignedSliderLayoutSubviewsDecorator) -> Self
    @discardableResult
    func setThumbRectDecorator(_ thumbRectDecorator: DesignedSliderThumbRectDecorator) -> Self
    
    @discardableResult
    func setThumbImage(_ thumbImage: ImageSet) -> Self
    @discardableResult
    func setMinimumTrackColors(_ minimumColors: ColorSet) -> Self
    @discardableResult
    func setMaximumTrackColors(_ maximumColors: ColorSet) -> Self
    
    @discardableResult
    func setMinimumValue(_ minimumValue: Float) -> Self
    @discardableResult
    func setMaximumValue(_ maximumValue: Float) -> Self
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
    public func setSliderDrawer(_ sliderDrawer: DesignedSliderDrawer) -> Self {
        self.sliderDrawer = sliderDrawer
        return self
    }
    
    @discardableResult
    public func setTrackingEventHandler(_ trackingEventHandler: DesignedSliderTrackingEventHandler) -> Self {
        self.trackingEventHandler = trackingEventHandler
        return self
    }
    
    @discardableResult
    public func setLayoutSubviewsDecorator(_ layoutSubviewsDecorator: DesignedSliderLayoutSubviewsDecorator) -> Self {
        self.layoutSubviewsDecorator = layoutSubviewsDecorator
        return self
    }
    
    @discardableResult
    public func setThumbRectDecorator(_ thumbRectDecorator: DesignedSliderThumbRectDecorator) -> Self {
        self.thumbRectDecorator = thumbRectDecorator
        return self
    }
    
    @discardableResult
    public func setThumbImage(_ thumbImage: ImageSet) -> Self {
        self.thumbImages = DesignedSliderThumbImage(thumbImage: thumbImage)
        self.thumbImages?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setMinimumTrackColors(_ minimumColors: ColorSet) -> Self {
        self.minimumTrackColors = DesignedSliderMinimumTrackColor(colorSet: minimumColors)
        self.minimumTrackColors?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setMaximumTrackColors(_ maximumColors: ColorSet) -> Self {
        self.maximumTrackColors = DesignedSliderMaximumTrackColor(colorSet: maximumColors)
        self.maximumTrackColors?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setMinimumValue(_ minimumValue: Float) -> Self {
        self.minimumValue = minimumValue
        return self
    }
    
    @discardableResult
    public func setMaximumValue(_ maximumValue: Float) -> Self {
        self.maximumValue = maximumValue
        return self
    }
}
