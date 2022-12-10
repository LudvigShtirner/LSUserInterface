//
//  BaseDesignedViewParameters.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

import SupportCode
// Apple
import UIKit

/// Типы применяемых свойств
public struct BaseDesignedViewParameters {
    var cornerRadius: CornerRadius.Parameter
    var backgroundColor: BackgroundColor.Parameter
    var border: Border.Parameter
}

struct InternalBaseDesignedViewParameters {
    var cornerRadius: CornerRadius?
    var backgroundColor: BackgroundColor?
    var border: Border?
}

/// Базовый протокол свойства
public protocol BaseDesignedViewParameter {
    associatedtype Parameter
    func apply(to view: BaseDesignedView)
}
