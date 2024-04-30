//
//  LSKeyFrameAnimator.swift
//
//
//  Created by Алексей Филиппов on 24.11.2023.
//

// Apple
import UIKit

protocol LSKeyFrameAnimator {
    var key: String { get }
    
    func alreadyAtFinishState() -> Bool
    func preaction()
    func runAnimation(_ animation: CAKeyframeAnimation)
    func completeAnimation(success: Bool)
}
