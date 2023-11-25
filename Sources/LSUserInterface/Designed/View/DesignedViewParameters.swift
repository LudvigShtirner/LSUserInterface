//
//  DesignedViewParameters.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

/// Типы применяемых свойств
public struct DesignedViewParameters {
    public var cornerRadius: DesignedViewCornerRadius.Parameter
    public var backgroundColor: DesignedViewBackgroundColor.Parameter
    public var border: DesignedViewBorder.Parameter
    public var shadow: DesignedViewShadow.Parameter?
    public var isHidden: Bool
    public var clipsToBounds: Bool
    public var alpha: CGFloat
    
    static func makeDefault() -> DesignedViewParameters {
        return .init(cornerRadius: .fixed(.zero),
                     backgroundColor: .fixed(.init(color: .white)),
                     border: .fixed(.zero, .init(color: .clear)),
                     shadow: nil,
                     isHidden: false,
                     clipsToBounds: false,
                     alpha: 1)
    }
}

struct InternalDesignedViewParameters {
    var cornerRadius: DesignedViewCornerRadius?
    var backgroundColor: DesignedViewBackgroundColor?
    var border: DesignedViewBorder?
    var shadow: DesignedViewShadow?
}
