//
//  LSAnimator.swift
//  
//
//  Created by Алексей Филиппов on 25.04.2023.
//

// Apple
import UIKit

protocol LSAnimator {
    func alreadyAtFinishState() -> Bool
    func preaction()
    func runAnimation()
    func completeAnimation(duration: TimeInterval,
                           success: Bool)
}
