//
//  LSViewConstraintsAnimator.swift
//  
//
//  Created by Алексей Филиппов on 29.05.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct LSViewConstraintsAnimator: LSAnimator {
    // MARK: - Data
    private let view: UIView
    private let constraintsSetAction: VoidBlock
    private let completion: BoolBlock?
    
    // MARK: - Inits
    init(view: UIView,
         constraintsSetAction: @escaping VoidBlock,
         completion: BoolBlock?) {
        self.view = view
        self.constraintsSetAction = constraintsSetAction
        self.completion = completion
    }
    
    // MARK: - LSAnimator
    func alreadyAtFinishState() -> Bool {
        return false
    }
    
    func preaction() {
        
    }
    
    func runAnimation() {
        constraintsSetAction()
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    func completeAnimation(success: Bool) {
        completion?(success)
    }
}
