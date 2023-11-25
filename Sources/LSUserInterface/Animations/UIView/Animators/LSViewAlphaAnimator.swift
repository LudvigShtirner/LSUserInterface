//
//  LSViewAlphaAnimator.swift
//  
//
//  Created by Алексей Филиппов on 27.05.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct LSViewAlphaAnimator: LSAnimator {
    // MARK: - Data
    private let view: UIView
    private let alpha: CGFloat
    private let completion: BoolBlock?
    
    // MARK: - Inits
    init(view: UIView,
         alpha: CGFloat,
         completion: BoolBlock?) {
        self.view = view
        self.alpha = alpha
        self.completion = completion
    }
    
    // MARK: - LSAnimator
    func alreadyAtFinishState() -> Bool {
        abs(view.alpha - alpha) < .ulpOfOne
    }
    
    func preaction() {
        
    }
    
    func runAnimation() {
        view.alpha = alpha
    }
    
    func completeAnimation(success: Bool) {
        completion?(success)
    }
}
