//
//  DesignedButtonParameters.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct DesignedButtonParameters {
    var tintColor: DesignedButtonTintColor.Parameter
    var titleColor: DesignedButtonTitleColor.Parameter
    var imageSet: DesignedButtonImageSet.Parameter
    var titleSet: DesignedButtonTitleSet.Parameter
}

struct InternalDesignedButtonParameters {
    var tintColor: DesignedButtonTintColor?
    var titleColor: DesignedButtonTitleColor?
}

/// Базовый протокол свойства
public protocol DesignedButtonParameter {
    associatedtype Parameter
    func apply(to button: UIButton)
}
