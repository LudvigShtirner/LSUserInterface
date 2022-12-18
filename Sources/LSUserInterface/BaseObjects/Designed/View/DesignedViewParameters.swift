//
//  DesignedViewParameters.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Типы применяемых свойств
public struct DesignedViewParameters {
    var cornerRadius: DesignedViewCornerRadius.Parameter
    var backgroundColor: DesignedViewBackgroundColor.Parameter
    var border: DesignedViewBorder.Parameter
    
    static func makeDefault() -> DesignedViewParameters {
        return .init(cornerRadius: .zero,
                     backgroundColor: .init(color: .clear),
                     border: (.zero, .init(color: .clear)))
    }
}

struct InternalDesignedViewParameters {
    var cornerRadius: DesignedViewCornerRadius?
    var backgroundColor: DesignedViewBackgroundColor?
    var border: DesignedViewBorder?
}

/// Базовый протокол свойства
public protocol DesignedViewParameter {
    associatedtype Parameter
    func apply(to view: UIView)
}
