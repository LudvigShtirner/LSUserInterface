//
//  LSViewTransformAnimator.swift
//  
//
//  Created by Алексей Филиппов on 25.04.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct LSViewTransformAnimator: LSAnimator {
    // MARK: - Data
    private let view: UIView
    private let transform: CGAffineTransform
    private let completion: BoolBlock?
    
    // MARK: - Inits
    init(view: UIView,
         transform: CGAffineTransform,
         completion: BoolBlock?) {
        self.view = view
        self.transform = transform
        self.completion = completion
    }
    
    // MARK: - LSAnimator
    func alreadyAtFinishState() -> Bool {
        view.transform == transform
    }
    
    func preaction() {
        
    }
    
    func runAnimation() {
        view.transform = transform
    }
    
    func completeAnimation(success: Bool) {
        completion?(success)
    }
}
