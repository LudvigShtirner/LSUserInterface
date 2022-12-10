//
//  LongTapGestureHandler.swift
//  CommonViews
//
//  Created by Алексей Филиппов on 23.04.2022.
//

import UIKit

// Обработчик длительных нажатий
public final class LongTapGestureHandler: GestureHandler {
    // MARK: - Info
    private var longTapGR: UILongPressGestureRecognizer!
    private var beganAction: GestureBlock?
    private var changedAction: GestureBlock?
    private var endedAction: GestureBlock?
    private var failedAction: GestureBlock?
    private var cancelledAction: GestureBlock?
    
    // MARK: - Life cycle
    public init(delegate: UIGestureRecognizerDelegate? = nil) {
        longTapGR = UILongPressGestureRecognizer(target: self,
                                                 action: #selector(handleLongTap(_:)))
        longTapGR.delegate = delegate
        longTapGR.allowableMovement = 5.0
        longTapGR.minimumPressDuration = 0.2
        longTapGR.delaysTouchesEnded = false
    }
    
    // MARK: - GestureHandler
    public typealias GestureType = UILongPressGestureRecognizer
    
    public var gestureRecognizer: GestureType { longTapGR }
    
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
    private func handleLongTap(_ longTap: UILongPressGestureRecognizer) {
        switch longTap.state {
        case .began:
            beganAction?(longTap)
        case .changed:
            changedAction?(longTap)
        case .ended:
            endedAction?(longTap)
        case .cancelled:
            cancelledAction?(longTap)
        case .failed:
            failedAction?(longTap)
        default: break
        }
    }
}
