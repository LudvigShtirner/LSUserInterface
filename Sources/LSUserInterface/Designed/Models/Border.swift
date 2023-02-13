//
//  Border.swift
//  
//
//  Created by Алексей Филиппов on 13.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct Border {
    // MARK: - Data
    let width: CGFloat
    let colorMap: ColorMap
    
    // MARK: - Life cycle
    public init(width: CGFloat,
                colorMap: ColorMap) {
        self.width = width
        self.colorMap = colorMap
    }
}
