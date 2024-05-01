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
    func usingHitTestDecorator(_ decorator: DesignedViewHitTestDecorator) -> Self
    
    @discardableResult
    func usingBackgroundColor(_ backgroundColor: ColorMap) -> Self
    @discardableResult
    func usingCornerRadius(_ cornerRadius: CornerRadius) -> Self
    @discardableResult
    func usingBorder(_ border: Border) -> Self
    @discardableResult
    func usingShadow(_ shadow: Shadow) -> Self
    
    @discardableResult
    func usingClipsToBounds(_ clipsToBounds: Bool) -> Self
    @discardableResult
    func usingUserInteractionEnabled(_ enabled: Bool) -> Self
    @discardableResult
    func usingHidden(_ isHidden: Bool) -> Self
    @discardableResult
    func usingAlpha(_ alpha: CGFloat) -> Self
}

protocol DesignedViewInterfaceInternal: DesignedViewInterface {
    var hitTestDecorator: DesignedViewHitTestDecorator? { get set }
    
    var lsCornerRadius: DesignedViewCornerRadius? { get set }
    var lsBackgroundColor: DesignedViewBackgroundColor? { get set }
    var lsBorder: DesignedViewBorder? { get set }
    var lsShadow: DesignedViewShadow? { get set }
}

extension DesignedViewInterfaceInternal {
    public func usingHitTestDecorator(_ decorator: DesignedViewHitTestDecorator) -> Self {
        self.hitTestDecorator = decorator
        return self
    }
    
    public func usingBackgroundColor(_ backgroundColor: ColorMap) -> Self {
        self.lsBackgroundColor = DesignedViewBackgroundColor(value: backgroundColor)
        self.lsBackgroundColor?.apply(to: self)
        return self
    }
    
    public func usingCornerRadius(_ cornerRadius: CornerRadius) -> Self {
        self.lsCornerRadius = DesignedViewCornerRadius(value: cornerRadius)
        self.lsCornerRadius?.apply(to: self)
        return self
    }
    
    public func usingBorder(_ border: Border) -> Self {
        self.lsBorder = DesignedViewBorder(border: border)
        self.lsBorder?.apply(to: self)
        return self
    }
    
    public func usingShadow(_ shadow: Shadow) -> Self {
        self.lsShadow = DesignedViewShadow(value: shadow)
        self.lsShadow?.apply(to: self)
        return self
    }
    
    public func usingClipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    public func usingUserInteractionEnabled(_ enabled: Bool) -> Self {
        isUserInteractionEnabled = enabled
        return self
    }
    
    public func usingHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    public func usingAlpha(_ alpha: CGFloat) -> Self {
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
