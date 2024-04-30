//
//  DesignedSliderDrawer.swift
//
//
//  Created by Алексей Филиппов on 16.01.2024.
//

// Apple
import UIKit

public protocol DesignedSliderDrawer: AnyObject {
    func drawSlider(_ slider: DesignedSlider,
                    rect: CGRect,
                    context: CGContext) -> Bool
}
