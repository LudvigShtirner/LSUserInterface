//
//  LSAnimation.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

public protocol LSAnimation {
    associatedtype Configuration
    
    func execute(view: UIView,
                 config: Configuration)
    func execute(views: [UIView],
                 config: Configuration)
}

public struct LSAnimationEP {
    public static let view: LSViewAnimation.Type = LSViewAnimation.self
}
