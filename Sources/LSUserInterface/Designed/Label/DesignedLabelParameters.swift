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
    public var font: UIFont
    public var numberOfLines: NumberOfLines
    public var text: String
    public var textAlignment: NSTextAlignment
}

struct InternalDesignedLabelParameters {
    var textColor: DesignedLabelTextColor?
}
