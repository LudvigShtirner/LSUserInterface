//
//  ColorSet.swift
//  
//
//  Created by Алексей Филиппов on 12.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct ColorSet {
    let normal: ColorMap
    let highlighted: ColorMap
    let disabled: ColorMap
    
    public init(normal: ColorMap,
                highlighted: ColorMap? = nil,
                disabled: ColorMap? = nil) {
        self.normal = normal
        self.highlighted = highlighted ?? normal
        self.disabled = disabled ?? normal
    }
    
    func current(isHighlighted: Bool,
                 isEnabled: Bool) -> ColorMap {
        if isEnabled {
            if isHighlighted {
                return highlighted
            } else {
                return normal
            }
        } else {
            return disabled
        }
    }
}
