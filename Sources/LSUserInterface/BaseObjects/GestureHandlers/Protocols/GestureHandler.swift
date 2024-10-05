//
//  GestureHandler.swift
//  CommonViews
//
//  Created by Алексей Филиппов on 23.04.2022.
//

import UIKit

// Протокол любого обработчика жестов
public protocol GestureHandler: AnyObject {
    associatedtype GestureType: UIGestureRecognizer
    typealias GestureBlock = (GestureType) -> Void
    
    var gestureRecognizer: GestureType { get }

    var isEnabled: Bool { get set }
    var isActive: Bool { get }
        
    @discardableResult
    func onStart(_ closure: @escaping GestureBlock) -> Self
    
    @discardableResult
    func onChange(_ closure: @escaping GestureBlock) -> Self
    
    @discardableResult
    func onEnd(_ closure: @escaping GestureBlock) -> Self
    
    @discardableResult
    func onFail(_ closure: @escaping GestureBlock) -> Self
    
    @discardableResult
    func onCancel(_ closure: @escaping GestureBlock) -> Self
    
    @discardableResult
    func insert(into view: UIView) -> Self
    
    @discardableResult
    func onShouldBeginAction(_ closure: @escaping (GestureType) -> Bool) -> Self
    
    @discardableResult
    func onShouldRecognizeSimultaneously(_ closure: @escaping (GestureType, UIGestureRecognizer) -> Bool) -> Self
    
    @discardableResult
    func onShouldRequireFailure(_ closure: @escaping (GestureType, UIGestureRecognizer) -> Bool) -> Self
    
    @discardableResult
    func onShouldBeRequiredToFail(_ closure: @escaping (GestureType, UIGestureRecognizer) -> Bool) -> Self
    
    @discardableResult
    func onShouldReceiveTouch(_ closure: @escaping (GestureType, UITouch) -> Bool) -> Self
    
    @discardableResult
    func onShouldReceivePress(_ closure: @escaping (GestureType, UIPress) -> Bool) -> Self
    
    @discardableResult
    func onShouldReceiveEvent(_ closure: @escaping (GestureType, UIEvent) -> Bool) -> Self
}

public extension GestureHandler {
    var isActive: Bool {
        return gestureRecognizer.state != .possible
    }
    
    var isEnabled: Bool {
        get { gestureRecognizer.isEnabled }
        set { gestureRecognizer.isEnabled = newValue }
    }
    
    @discardableResult
    func insert(into view: UIView) -> Self {
        view.addGestureRecognizer(gestureRecognizer)
        return self
    }
}

protocol GestureHandlerInternal: GestureHandler {
    var delegate: GestureRecognizerDelegate<GestureType> { get }
}

extension GestureHandlerInternal {
    @discardableResult
    public func onShouldBeginAction(_ closure: @escaping (GestureType) -> Bool) -> Self {
        delegate.shouldBeginAction = closure
        gestureRecognizer.delegate = delegate
        return self
    }
    
    @discardableResult
    public func onShouldRecognizeSimultaneously(_ closure: @escaping (GestureType, UIGestureRecognizer) -> Bool) -> Self {
        delegate.shouldRecognizeSimultaneously = closure
        gestureRecognizer.delegate = delegate
        return self
    }
    
    @discardableResult
    public func onShouldRequireFailure(_ closure: @escaping (GestureType, UIGestureRecognizer) -> Bool) -> Self {
        delegate.shouldRequireFailure = closure
        gestureRecognizer.delegate = delegate
        return self
    }
    
    @discardableResult
    public func onShouldBeRequiredToFail(_ closure: @escaping (GestureType, UIGestureRecognizer) -> Bool) -> Self {
        delegate.shouldBeRequiredToFail = closure
        gestureRecognizer.delegate = delegate
        return self
    }
    
    @discardableResult
    public func onShouldReceiveTouch(_ closure: @escaping (GestureType, UITouch) -> Bool) -> Self {
        delegate.shouldReceiveTouch = closure
        gestureRecognizer.delegate = delegate
        return self
    }
    
    @discardableResult
    public func onShouldReceivePress(_ closure: @escaping (GestureType, UIPress) -> Bool) -> Self {
        delegate.shouldReceivePress = closure
        gestureRecognizer.delegate = delegate
        return self
    }
    
    @discardableResult
    public func onShouldReceiveEvent(_ closure: @escaping (GestureType, UIEvent) -> Bool) -> Self {
        delegate.shouldReceiveEvent = closure
        gestureRecognizer.delegate = delegate
        return self
    }
}
