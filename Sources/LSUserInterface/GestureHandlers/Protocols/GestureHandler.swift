//
//  GestureHandler.swift
//  CommonViews
//
//  Created by Алексей Филиппов on 23.04.2022.
//

import UIKit

// Протокол любого обработчика жестов
public protocol GestureHandler: AnyObject {
    associatedtype GestureType
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
}

public extension GestureHandler {
    var isActive: Bool {
        guard let gesRec = gestureRecognizer as? UIGestureRecognizer else {
            return false
        }
        return gesRec.state != .possible
    }
    
    var isEnabled: Bool {
        get {
            guard let gesRec = gestureRecognizer as? UIGestureRecognizer else {
                return false
            }
            return gesRec.isEnabled
        }
        set {
            guard let gesRec = gestureRecognizer as? UIGestureRecognizer else {
                return
            }
            gesRec.isEnabled = newValue
        }
    }
}

