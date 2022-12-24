//
//  DesignedLabelParameters.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import UIKit

public struct DesignedLabelParameters {
    public var textColor: DesignedLabelTextColor.Parameter
    public var font: DesignedLabelFont.Parameter
    public var numberOfLines: DesignedLabelNumberOfLines.Parameter
    public var text: DesignedLabelText.Parameter
}

struct InternalDesignedLabelParameters {
    var textColor: DesignedLabelTextColor?
}

public protocol DesignedLabelParameter {
    associatedtype Parameter
}

protocol DesignedLabelParameterApplyable {
    func apply(to label: UILabel)
}
