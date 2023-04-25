//
//  LSAnimation.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

public struct LSAnimation {
    // MARK: - Data
    let animator: LSAnimator
    
    // MARK: - Inits
    init(animator: LSAnimator) {
        self.animator = animator
    }
    
    // MARK: - Access
    public static let view: LSViewAnimation.Type = LSViewAnimation.self
    
    // MARK: - Interface methods
    public func execute(duration: TimeInterval = 0.3,
                        delay: TimeInterval = .zero,
                        options: UIView.AnimationOptions = []) {
        if animator.alreadyAtFinishState() {
            return
        }
        animator.preaction()
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options) {
            self.animator.runAnimation()
        } completion: { success in
            self.animator.completeAnimation(success: success)
        }
    }
}
