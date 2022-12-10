//
//  PanGestureHandler.swift
//  CommonViews
//
//  Created by Алексей Филиппов on 23.04.2022.
//

import UIKit

/// Обработчик pan жестов
public final class PanGestureHandler: GestureHandler {
    // MARK: - Info
    private var panGR: UIPanGestureRecognizer!
    private var beganAction: GestureBlock?
    private var changedAction: GestureBlock?
    private var endedAction: GestureBlock?
    private var failedAction: GestureBlock?
    private var cancelledAction: GestureBlock?
    
    // MARK: - Life cycle
    public init(touchesNumber: Int,
                delegate: UIGestureRecognizerDelegate? = nil) {
        panGR = UIPanGestureRecognizer(target: self,
                                       action: #selector(handlePan(_:)))
        panGR.delegate = delegate
        panGR.maximumNumberOfTouches = touchesNumber
        panGR.minimumNumberOfTouches = touchesNumber
    }
    
    // MARK: - GestureHandler
    public typealias GestureType = UIPanGestureRecognizer
    
    public var gestureRecognizer: GestureType { return panGR }
    
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
    private func handlePan(_ pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            beganAction?(pan)
        case .changed:
            changedAction?(pan)
        case .ended:
            endedAction?(pan)
        case .cancelled:
            cancelledAction?(pan)
        case .failed:
            failedAction?(pan)
        default: break
        }
    }
}
