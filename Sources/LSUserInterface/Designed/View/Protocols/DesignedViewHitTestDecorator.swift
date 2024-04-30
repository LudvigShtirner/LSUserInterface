//
//  DesignedViewHitTestDecorator.swift
//
//
//  Created by Алексей Филиппов on 14.01.2024.
//

// Apple
import UIKit

public protocol DesignedViewHitTestDecorator: AnyObject {
    func hitTest(_ point: CGPoint,
                 with event: UIEvent?) -> UIView?
}
