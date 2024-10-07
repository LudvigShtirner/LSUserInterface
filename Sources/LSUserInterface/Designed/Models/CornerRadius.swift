//
//  CornerRadius.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

/// Скругление
public enum CornerRadius {
    case fixed(CGFloat)
    case circled
    case masked(corners: UIRectCorner, radius: CGFloat)
}
