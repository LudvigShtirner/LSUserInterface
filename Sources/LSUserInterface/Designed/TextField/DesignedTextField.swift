//
//  DesignedTextField.swift
//
//
//  Created by Алексей Филиппов on 02.06.2024.
//

// Apple
import UIKit

open class DesignedTextField: BaseTextField {
    // MARK: - Data
    private var leftViewParameter: ViewParameter?
    private var rightViewParameter: ViewParameter?
    
    // MARK: - Overrides
    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        leftViewParameter?.rectProvider?(bounds) ?? super.leftViewRect(forBounds: bounds)
    }
    
    open override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        rightViewParameter?.rectProvider?(bounds) ?? super.rightViewRect(forBounds: bounds)
    }
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        textRect(forBounds: bounds)
    }

    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        let leftViewRect = leftViewRect(forBounds: bounds)
        let rightViewRect = rightViewRect(forBounds: bounds)
        return CGRect(x: leftViewRect.maxX,
                      y: .zero,
                      width: rightViewRect.minX - leftViewRect.maxX,
                      height: bounds.height)
    }

    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        textRect(forBounds: bounds)
    }
}

public extension DesignedTextField {
    struct ViewParameter {
        let view: UIView
        let rectProvider: ((CGRect) -> CGRect)?
        
        public init(view: UIView,
                    rectProvider: ((CGRect) -> CGRect)?) {
            self.view = view
            self.rectProvider = rectProvider
        }
    }
    
    func useLeftView(_ view: ViewParameter) -> Self {
        self.leftViewParameter = view
        return self
    }
    
    func useRightView(_ view: ViewParameter) -> Self {
        self.rightViewParameter = view
        return self
    }
}
