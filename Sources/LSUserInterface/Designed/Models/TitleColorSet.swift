//
//  TitleColorSet.swift
//  
//
//  Created by Алексей Филиппов on 12.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct TitleColorSet {
    let normal: ColorMap
    let highlighted: ColorMap?
    let disabled: ColorMap?
    
    public init(normal: ColorMap,
                highlighted: ColorMap? = nil,
                disabled: ColorMap? = nil) {
        self.normal = normal
        self.highlighted = highlighted
        self.disabled = disabled
    }
}
