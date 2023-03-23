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
    
    static func makeDefault() -> DesignedViewParameters {
        return .init(cornerRadius: CornerRadius.fixed(.zero),
                     backgroundColor: .init(color: .white),
                     border: .init(width: .zero, colorMap: .init(color: .clear)))
    }
}

struct InternalDesignedViewParameters {
    var cornerRadius: DesignedViewCornerRadius?
    var backgroundColor: DesignedViewBackgroundColor?
    var border: DesignedViewBorder?
}
