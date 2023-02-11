//
//  LSViewHideAnimation.swift
//  
//
//  Created by Алексей Филиппов on 16.01.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct LSViewHideAnimation: LSAnimation {
    // MARK: - LSAnimation
    public typealias Configuration = LSViewHideAnimationConfiguration
    
    public func execute(view: UIView,
                        config: LSViewHideAnimationConfiguration) {
        if view.isHidden == config.hide {
            return
        }
        UIView.animate(withDuration: config.duration,
                       delay: config.delay,
                       options: config.options,
                       animations: {
            view.alpha = config.hide ? .zero : 1.0
        },
                       completion: { [weak view] success in
            view?.isHidden = config.hide
            view?.alpha = 1.0
            config.completion?(success)
        })
    }
    
    public func execute(views: [UIView],
                        config: LSViewHideAnimationConfiguration) {
        let filtered = views.filter { $0.isHidden != config.hide }
        if filtered.isEmpty {
            return
        }
        UIView.animate(withDuration: config.duration,
                       delay: config.delay,
                       options: config.options,
                       animations: {
            filtered.forEach { $0.alpha = config.hide ? .zero : 1.0 }
        },
                       completion: { success in
            filtered.forEach {
                $0.isHidden = config.hide
                $0.alpha = 1.0
            }
            config.completion?(success)
        })
    }
}

public struct LSViewHideAnimationConfiguration {
    let hide: Bool
    let duration: TimeInterval
    let delay: TimeInterval
    let options: UIView.AnimationOptions
    let completion: BoolBlock?
    
    public init(hide: Bool,
                duration: TimeInterval = 0.3,
                delay: TimeInterval = .zero,
                options: UIView.AnimationOptions = [],
                completion: BoolBlock? = nil) {
        self.hide = hide
        self.duration = duration
        self.delay = delay
        self.options = options
        self.completion = completion
    }
}
