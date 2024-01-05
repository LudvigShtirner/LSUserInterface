//
//  Border.swift
//  
//
//  Created by Алексей Филиппов on 13.02.2023.
//

// Apple
import UIKit

public enum Border {
    case fixed(width: CGFloat, color: ColorMap)
    case changeable(width: CGFloat, colors: ColorSet)
}
