//
//  DesignedSliderInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedSliderInterface: UISlider {
    var sliderDrawer: DesignedSliderDrawer? { get set }
    var trackingEventHandler: DesignedSliderTrackingEventHandler? { get set }
    var layoutSubviewsDecorator: DesignedSliderLayoutSubviewsDecorator? { get set }
    var thumbRectDecorator: DesignedSliderThumbRectDecorator? { get set }
    
    func useThumbImage(_ thumbImage: ImageSet)
    func useThumbTintColor(_ thumbColors: ColorSet)
    func useMinimumTrackColors(_ minimumColors: ColorSet)
    func useMaximumTrackColors(_ maximumColors: ColorSet)
}

protocol DesignedSliderInterfaceInternal: DesignedSliderInterface {
    var thumbImages: DesignedSliderThumbImage? { get set }
    var thumbColors: DesignedSliderThumbColors? { get set }
    var minimumTrackColors: DesignedSliderMinimumTrackColor? { get set }
    var maximumTrackColors: DesignedSliderMaximumTrackColor? { get set }
}

extension DesignedSliderInterfaceInternal {
    public func useThumbImage(_ thumbImage: ImageSet) {
        self.thumbImages = DesignedSliderThumbImage(thumbImage: thumbImage)
        self.thumbImages?.apply(to: self)
    }
    
    public func useThumbTintColor(_ thumbColors: ColorSet) {
        self.thumbColors = DesignedSliderThumbColors(thumbColors: thumbColors)
        self.thumbColors?.apply(to: self)
    }
    
    public func useMinimumTrackColors(_ minimumColors: ColorSet) {
        self.minimumTrackColors = DesignedSliderMinimumTrackColor(colorSet: minimumColors)
        self.minimumTrackColors?.apply(to: self)
    }
    
    public func useMaximumTrackColors(_ maximumColors: ColorSet) {
        self.maximumTrackColors = DesignedSliderMaximumTrackColor(colorSet: maximumColors)
        self.maximumTrackColors?.apply(to: self)
    }
}
