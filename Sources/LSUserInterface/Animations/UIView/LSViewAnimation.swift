//
//  LSViewAnimation.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct LSViewAnimation {
    public static func hide(view: UIView,
                            config: HideAnimatorConfiguration,
                            completion: BoolBlock? = nil) -> LSAnimation {
        let animator = LSViewHideAnimator(view: view,
                                          config: config,
                                          completion: completion)
        return LSAnimation(animator: animator)
    }
    
    public static func transform(view: UIView,
                                 transform: CGAffineTransform,
                                 completion: BoolBlock? = nil) -> LSAnimation {
        let animator = LSViewTransformAnimator(view: view,
                                               transform: transform,
                                               completion: completion)
        return LSAnimation(animator: animator)
    }
}
