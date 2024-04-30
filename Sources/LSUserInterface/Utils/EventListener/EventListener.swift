//
//  EventListener.swift
//
//
//  Created by Алексей Филиппов on 25.11.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public protocol EventListener: UIControl {
    @discardableResult
    func onEvent(_ action: UIControl.Event,
                 _ closure: @escaping VoidBlock) -> Self
    
    @discardableResult
    func onEvents(_ actions: [UIControl.Event],
                  _ closure: @escaping VoidBlock) -> Self
}

protocol EventListenerInternal: EventListener {
    var listeners: [String: UIControlListener] { get set }
}

extension EventListenerInternal {
    @discardableResult
    public func onEvent(_ action: UIControl.Event,
                        _ closure: @escaping VoidBlock) -> Self {
        let listener = UIControlListener(control: self,
                                         event: action,
                                         action: closure)
        listeners[listener.key] = listener
        return self
    }
    
    // MARK: - Public methods
    @discardableResult
    public func onEvents(_ actions: [UIControl.Event],
                         _ closure: @escaping VoidBlock) -> Self {
        actions.forEach { action in
            onEvent(action, closure)
        }
        return self
    }
}
