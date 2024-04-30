//
//  DesignedSliderTrackingEventHandler.swift
//
//
//  Created by Алексей Филиппов on 16.01.2024.
//

// Apple
import UIKit

public protocol DesignedSliderTrackingEventHandler: AnyObject {
    func beginTracking(_ touch: UITouch,
                       with event: UIEvent?,
                       on slider: DesignedSlider)
    func endTracking(_ touch: UITouch?,
                     with event: UIEvent?,
                     on slider: DesignedSlider)
}
