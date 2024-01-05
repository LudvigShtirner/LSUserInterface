//
//  Shadow.swift
//  
//
//  Created by Алексей Филиппов on 21.04.2023.
//

// Apple
import UIKit

public struct Shadow {
    let color: ColorMap
    let radius: CornerRadius
    let opacity: Float
    let offset: CGSize
    
    public init(color: ColorMap = ColorMap(color: .black),
                radius: CornerRadius = CornerRadius.fixed(3),
                opacity: Float = Float.zero,
                offset: CGSize = CGSize(width: .zero, height: -3)) {
        self.color = color
        self.radius = radius
        self.opacity = opacity
        self.offset = offset
    }
}
