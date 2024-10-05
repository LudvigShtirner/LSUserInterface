//
//  DesignedViewInterface.swift
//  
//
//  Created by Алексей Филиппов on 22.04.2023.
//

// Apple
import UIKit

public protocol DesignedViewInterface: UIView {
    var hitTestDecorator: DesignedViewHitTestDecorator? { get set }
    
    func useBackgroundColor(_ backgroundColor: ColorMap)
    func useCornerRadius(_ cornerRadius: CornerRadius)
    func useBorder(_ border: Border)
    func useShadow(_ shadow: Shadow)
}

protocol DesignedViewInterfaceInternal: DesignedViewInterface {
    var lsCornerRadius: DesignedViewCornerRadius? { get set }
    var lsBackgroundColor: DesignedViewBackgroundColor? { get set }
    var lsBorder: DesignedViewBorder? { get set }
    var lsShadow: DesignedViewShadow? { get set }
}

extension DesignedViewInterfaceInternal {
    public func useBackgroundColor(_ backgroundColor: ColorMap) {
        self.lsBackgroundColor = DesignedViewBackgroundColor(value: backgroundColor)
        self.lsBackgroundColor?.apply(to: self)
    }
    
    public func useCornerRadius(_ cornerRadius: CornerRadius) {
        self.lsCornerRadius = DesignedViewCornerRadius(value: cornerRadius)
        self.lsCornerRadius?.apply(to: self)
    }
    
    public func useBorder(_ border: Border) {
        self.lsBorder = DesignedViewBorder(border: border)
        self.lsBorder?.apply(to: self)
    }
    
    public func useShadow(_ shadow: Shadow) {
        self.lsShadow = DesignedViewShadow(value: shadow)
        self.lsShadow?.apply(to: self)
    }
}

extension NSObjectProtocol {
    @discardableResult
    public func apply(_ closure: @escaping (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}
