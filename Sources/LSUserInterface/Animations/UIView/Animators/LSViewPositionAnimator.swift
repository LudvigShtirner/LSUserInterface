//
//  LSViewPositionAnimator.swift
//  
//
//  Created by Алексей Филиппов on 23.06.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct LSViewPositionAnimator: LSAnimator {
    // MARK: - Data
    private let view: UIView
    private let offset: CGPoint
    private let completion: BoolBlock?
    
    // MARK: - Inits
    init(view: UIView,
         offset: CGPoint,
         completion: BoolBlock?) {
        self.view = view
        self.offset = offset
        self.completion = completion
    }
    
    // MARK: - LSAnimator
    func alreadyAtFinishState() -> Bool {
        offset == .zero
    }
    
    func preaction() {
        
    }
    
    func runAnimation() {
        view.frame.origin = CGPoint(x: view.frame.origin.x - offset.x,
                                    y: view.frame.origin.y - offset.y)
    }
    
    func completeAnimation(success: Bool) {
        completion?(success)
    }
}
