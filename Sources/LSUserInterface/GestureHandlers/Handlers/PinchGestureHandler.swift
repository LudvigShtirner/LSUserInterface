//
//  PinchGestureHandler.swift
//  CommonViews
//
//  Created by Алексей Филиппов on 23.04.2022.
//

import UIKit

/// Обработчик pinch жестов
public final class PinchGestureHandler: GestureHandler {
    // MARK: - Info
    private var pinchGR: UIPinchGestureRecognizer!
    private var beganAction: GestureBlock?
    private var changedAction: GestureBlock?
    private var endedAction: GestureBlock?
    private var failedAction: GestureBlock?
    private var cancelledAction: GestureBlock?
    
    // MARK: - Life cycle
    public init(delegate: UIGestureRecognizerDelegate? = nil) {
        pinchGR = UIPinchGestureRecognizer(target: self,
                                           action: #selector(handlePinch(_:)))
        pinchGR.delegate = delegate
    }
    
    // MARK: - GestureHandler
    public typealias GestureType = UIPinchGestureRecognizer
    
    public var gestureRecognizer: GestureType { return pinchGR }
    
    public func onStart(_ closure: @escaping GestureBlock) -> Self {
        beganAction = closure
        return self
    }
    
    public func onChange(_ closure: @escaping GestureBlock) -> Self {
        changedAction = closure
        return self
    }
    
    public func onEnd(_ closure: @escaping GestureBlock) -> Self {
        endedAction = closure
        return self
    }
    
    public func onFail(_ closure: @escaping GestureBlock) -> Self {
        failedAction = closure
        return self
    }
    
    public func onCancel(_ closure: @escaping GestureBlock) -> Self {
        cancelledAction = closure
        return self
    }
    
    // MARK: - Actions
    @objc
    private func handlePinch(_ pinch: UIPinchGestureRecognizer) {
        switch pinch.state {
        case .began:
            beganAction?(pinch)
        case .changed:
            changedAction?(pinch)
        case .ended:
            endedAction?(pinch)
        case .cancelled:
            cancelledAction?(pinch)
        case .failed:
            failedAction?(pinch)
        default: break
        }
    }
}
