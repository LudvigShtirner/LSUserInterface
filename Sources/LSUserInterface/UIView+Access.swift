//
//  UIView+Access.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public extension UIView {
    var ls: LSAccess { LSAccess(view: self) }
}
