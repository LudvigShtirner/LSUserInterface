//
//  ControlBorder.swift
//  
//
//  Created by Алексей Филиппов on 15.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct ControlBorder {
    // MARK: - Data
    let width: CGFloat
    let colorSet: ColorSet
    
    // MARK: - Life cycle
    public init(width: CGFloat,
                colorSet: ColorSet) {
        self.width = width
        self.colorSet = colorSet
    }
}
