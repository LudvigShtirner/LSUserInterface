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
    var delegate: UIGestureRecognizerDelegate? { get set }
        
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
}

public extension GestureHandler {
    var isActive: Bool {
        return gestureRecognizer.state != .possible
    }
    
    var isEnabled: Bool {
        get { gestureRecognizer.isEnabled }
        set { gestureRecognizer.isEnabled = newValue }
    }
    
    var delegate: UIGestureRecognizerDelegate? {
        get { gestureRecognizer.delegate }
        set { gestureRecognizer.delegate = newValue }
    }
    
    func insert(into view: UIView) -> Self {
        view.addGestureRecognizer(gestureRecognizer)
        return self
    }
}

