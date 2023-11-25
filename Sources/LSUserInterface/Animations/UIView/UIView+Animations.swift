//
//  UIView+Animations.swift
//  
//
//  Created by Алексей Филиппов on 23.07.2023.
//

// Apple
import UIKit

public extension UIView {
    var animation: LSViewAnimation { LSViewAnimation(view: self) }
}
