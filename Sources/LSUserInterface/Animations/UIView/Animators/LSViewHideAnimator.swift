//
//  LSViewHideAnimator.swift
//  
//
//  Created by Алексей Филиппов on 16.01.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct LSViewHideAnimator: LSAnimator {
    // MARK: - Data
    let view: UIView
    let config: HideAnimatorConfiguration
    let completion: BoolBlock?
    
    // MARK: - Inits
    init(view: UIView,
         config: HideAnimatorConfiguration,
         completion: BoolBlock?) {
        self.view = view
        self.config = config
        self.completion = completion
    }
    
    // MARK: - LSAnimator
    func alreadyAtFinishState() -> Bool {
        view.isHidden == config.isHidden
    }
    
    func preaction() {
        view.isHidden = false
    }
    
    func runAnimation() {
        view.alpha = config.alpha
    }
    
    func completeAnimation(success: Bool) {
        view.isHidden = config.isHidden
        view.alpha = config.alpha
        completion?(success)
    }
}

// MARK: - Subtypes
public enum HideAnimatorConfiguration {
    case hide
    case show(CGFloat)
    
    var isHidden: Bool {
        switch self {
        case .hide:
            return true
        case .show:
            return false
        }
    }
    
    var alpha: CGFloat {
        switch self {
        case .hide:
            return .zero
        case .show(let alpha):
            return alpha
        }
    }
}
