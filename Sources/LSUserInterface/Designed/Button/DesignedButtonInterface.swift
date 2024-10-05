//
//  DesignedButtonInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedButtonInterface: UIButton {
    var drawer: DesignedButtonDrawer? { get set }
    
    func useTintColor(_ tintColor: ColorMap)
    func useTitleColor(_ titleColor: ColorSet)
    func useBackgroundColors(_ backgroundColors: ColorSet)
    
    func useImageSet(_ imageSet: ImageSet)
    func useBackgroundImageSet(_ imageSet: ImageSet)
    func useTitle(normalText: String,
                  highlightText: String?,
                  disabledText: String?)
    func useFont(_ font: UIFont)
    func useNumberOfLines(_ numberOfLines: NumberOfLines)
}

extension DesignedButtonInterface {
    public func useTitle(normalText: String) {
        useTitle(normalText: normalText,
                 highlightText: nil,
                 disabledText: nil)
    }
}
