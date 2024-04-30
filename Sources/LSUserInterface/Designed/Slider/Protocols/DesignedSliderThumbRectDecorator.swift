//
//  DesignedSliderThumbRectDecorator.swift
//
//
//  Created by Алексей Филиппов on 14.01.2024.
//

// Apple
import UIKit

public protocol DesignedSliderThumbRectDecorator: AnyObject {
    func thumbRect(forBounds bounds: CGRect,
                   trackRect rect: CGRect,
                   value: Float,
                   slider: DesignedSlider,
                   superAnswer: CGRect) -> CGRect
}
