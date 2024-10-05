//
//  UIScrollView+Scrolling.swift
//
//
//  Created by Алексей Филиппов on 11.05.2024.
//

// Apple
import UIKit

public extension UIScrollView {
    var scrollsUp: Bool {
        panGestureRecognizer.velocity(in: nil).y < 0
    }

    var scrollsDown: Bool {
        panGestureRecognizer.velocity(in: nil).y > 0
    }

    var isContentOriginInBounds: Bool {
        contentOffset.y.isAlmostEqual(to: adjustedContentInset.top)
    }
}
