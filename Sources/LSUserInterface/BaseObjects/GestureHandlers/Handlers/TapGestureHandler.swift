//
//  TapGestureHandler.swift
//  CommonViews
//
//  Created by Алексей Филиппов on 23.04.2022.
//

import UIKit

/// Обработчик одинарных нажатий
public final class TapGestureHandler: GestureHandler {
    // MARK: - Data
    private var tapGR: UITapGestureRecognizer!
    private var endedAction: GestureBlock?
    
    // MARK: - Inits
    public init() {
        tapGR = UITapGestureRecognizer(target: self,
                                       action: #selector(handleTap(_:)))
        tapGR.numberOfTapsRequired = 1
    }
    
    // MARK: - GestureHandler
    public typealias GestureType = UITapGestureRecognizer
    
    public var gestureRecognizer: GestureType { tapGR }
    
    @discardableResult
    public func onStart(_ closure: @escaping GestureBlock) -> Self {
        return self
    }
    
    @discardableResult
    public func onChange(_ closure: @escaping GestureBlock) -> Self {
        return self
    }
    
    @discardableResult
    public func onEnd(_ closure: @escaping GestureBlock) -> Self {
        endedAction = closure
        return self
    }
    
    @discardableResult
    public func onFail(_ closure: @escaping GestureBlock) -> Self {
        return self
    }
    
    @discardableResult
    public func onCancel(_ closure: @escaping GestureBlock) -> Self {
        return self
    }
    
    
    // MARK: - Actions
    @objc
    private func handleTap(_ tap: UITapGestureRecognizer) {
        switch tap.state {
        case .began:
            print("OnStart")
        case .changed:
            print("onChange")
        case .ended:
            endedAction?(tap)
        case .failed:
            print("onFail")
        case .cancelled:
            print("onCancel")
        default: break
        }
    }
}
