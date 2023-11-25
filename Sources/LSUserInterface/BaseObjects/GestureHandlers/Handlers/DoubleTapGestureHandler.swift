//
//  DoubleTapGestureHandler.swift
//  CommonViews
//
//  Created by Алексей Филиппов on 23.04.2022.
//

import UIKit

/// Обработчик двойных нажатий
public final class DoubleTapGestureHandler: GestureHandler {
    // MARK: - Data
    private var tapGR: UITapGestureRecognizer!
    private var beganAction: GestureBlock?
    private var changedAction: GestureBlock?
    private var endedAction: GestureBlock?
    private var failedAction: GestureBlock?
    private var cancelledAction: GestureBlock?
    
    // MARK: - Inits
    public init(delegate: UIGestureRecognizerDelegate? = nil) {
        tapGR = UITapGestureRecognizer(target: self,
                                       action: #selector(handleDoubleTap(_:)))
        tapGR.numberOfTapsRequired = 2
        tapGR.delegate = delegate
    }
    
    // MARK: - GestureHandler
    public typealias GestureType = UITapGestureRecognizer
    
    public var gestureRecognizer: GestureType { return tapGR }
    
    @discardableResult
    public func onStart(_ closure: @escaping GestureBlock) -> Self {
        beganAction = closure
        return self
    }
    
    @discardableResult
    public func onChange(_ closure: @escaping GestureBlock) -> Self {
        changedAction = closure
        return self
    }
    
    @discardableResult
    public func onEnd(_ closure: @escaping GestureBlock) -> Self {
        endedAction = closure
        return self
    }
    
    @discardableResult
    public func onFail(_ closure: @escaping GestureBlock) -> Self {
        failedAction = closure
        return self
    }
    
    @discardableResult
    public func onCancel(_ closure: @escaping GestureBlock) -> Self {
        cancelledAction = closure
        return self
    }
    
    // MARK: - Actions
    @objc
    private func handleDoubleTap(_ tap: UITapGestureRecognizer) {
        switch tap.state {
        case .began:
            beganAction?(tap)
        case .changed:
            changedAction?(tap)
        case .ended:
            endedAction?(tap)
        case .cancelled:
            cancelledAction?(tap)
        case .failed:
            failedAction?(tap)
        default: break
        }
    }
}

