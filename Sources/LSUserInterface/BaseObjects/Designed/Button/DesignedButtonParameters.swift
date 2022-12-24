//
//  DesignedButtonParameters.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

public struct DesignedButtonParameters {
    public var tintColor: DesignedButtonTintColor.Parameter
    public var titleColor: DesignedButtonTitleColor.Parameter
    public var imageSet: DesignedButtonImageSet.Parameter
    public var titleSet: DesignedButtonTitleSet.Parameter
}

struct InternalDesignedButtonParameters {
    var tintColor: DesignedButtonTintColor?
    var titleColor: DesignedButtonTitleColor?
}

/// Базовый протокол свойства
public protocol DesignedButtonParameter {
    associatedtype Parameter
}

protocol DesignedButtonParameterApplyable {
    func apply(to button: UIButton)
}
