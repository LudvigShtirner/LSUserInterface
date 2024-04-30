//
//  DesignedViewInterface.swift
//  
//
//  Created by Алексей Филиппов on 22.04.2023.
//

// Apple
import UIKit

public protocol DesignedViewInterface: UIView {
    @discardableResult
    func setHitTestDecorator(_ decorator: DesignedViewHitTestDecorator) -> Self
    
    @discardableResult
    func setBackgroundColor(_ backgroundColor: ColorMap) -> Self
    @discardableResult
    func setCornerRadius(_ cornerRadius: CornerRadius) -> Self
    @discardableResult
    func setBorder(_ border: Border) -> Self
    @discardableResult
    func setShadow(_ shadow: Shadow) -> Self
    
    @discardableResult
    func setClipsToBounds(_ clipsToBounds: Bool) -> Self
    @discardableResult
    func setUserInteractionEnabled(_ enabled: Bool) -> Self
    @discardableResult
    func setHidden(_ isHidden: Bool) -> Self
    @discardableResult
    func setAlpha(_ alpha: CGFloat) -> Self
}

protocol DesignedViewInterfaceInternal: DesignedViewInterface {
    var hitTestDecorator: DesignedViewHitTestDecorator? { get set }
    
    var lsCornerRadius: DesignedViewCornerRadius? { get set }
    var lsBackgroundColor: DesignedViewBackgroundColor? { get set }
    var lsBorder: DesignedViewBorder? { get set }
    var lsShadow: DesignedViewShadow? { get set }
}

extension DesignedViewInterfaceInternal {
    public func setHitTestDecorator(_ decorator: DesignedViewHitTestDecorator) -> Self {
        self.hitTestDecorator = decorator
        return self
    }
    
    public func setBackgroundColor(_ backgroundColor: ColorMap) -> Self {
        self.lsBackgroundColor = DesignedViewBackgroundColor(value: backgroundColor)
        self.lsBackgroundColor?.apply(to: self)
        return self
    }
    
    public func setCornerRadius(_ cornerRadius: CornerRadius) -> Self {
        self.lsCornerRadius = DesignedViewCornerRadius(value: cornerRadius)
        self.lsCornerRadius?.apply(to: self)
        return self
    }
    
    public func setBorder(_ border: Border) -> Self {
        self.lsBorder = DesignedViewBorder(border: border)
        self.lsBorder?.apply(to: self)
        return self
    }
    
    public func setShadow(_ shadow: Shadow) -> Self {
        self.lsShadow = DesignedViewShadow(value: shadow)
        self.lsShadow?.apply(to: self)
        return self
    }
    
    public func setClipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    public func setUserInteractionEnabled(_ enabled: Bool) -> Self {
        isUserInteractionEnabled = enabled
        return self
    }
    
    public func setHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    public func setAlpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
}

//
//extension UIView {
//    @discardableResult
//    public func apply<T: UIView>(_ closure: @escaping (T) -> Void) -> T {
//        closure(self)
//        return self
//    }
//}
//
//final class AAA: UIViewController {
//    private let view = BaseView().apply {
//        $0.backgroundColor = .red
//    }
//}
