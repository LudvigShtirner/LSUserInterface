//
//  UIEdgeInsets+Math.swift
//
//
//  Created by Алексей Филиппов on 24.04.2024.
//

// Apple
import UIKit

public extension UIEdgeInsets {
    @inlinable
    var horizontalInsets: CGFloat { left + right }

    @inlinable
    var verticalInsets: CGFloat { top + bottom }
}
