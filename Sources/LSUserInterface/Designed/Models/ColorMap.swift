//
//  ColorMap.swift
//  
//
//  Created by Алексей Филиппов on 04.08.2022.
//

// Apple
import UIKit

/**
 Map with colors for different color schemes
 
 - RU:
 
 Словарь цветов отображения для разных стилей
 */
public struct ColorMap {
    // MARK: - Data
    /// Цвет в светлой теме
    public let lightColor: UIColor
    /// Цвет в темной теме
    public let darkColor: UIColor
    
    // MARK: - Inits
    public init(lightColor: UIColor,
                darkColor: UIColor) {
        self.lightColor = lightColor
        self.darkColor = darkColor
    }
    
    public init(color: UIColor) {
        self.lightColor = color
        self.darkColor = color
    }
    
    public static func makeTransitedColorMap(colorMap: ColorMap,
                                             anotherColorMap: ColorMap,
                                             factor: CGFloat) -> ColorMap {
        let lightColor = UIColor.makeColorBetween(color: colorMap.lightColor,
                                                  anotherColor: anotherColorMap.lightColor,
                                                  factor: factor)
        let darkColor = UIColor.makeColorBetween(color: colorMap.darkColor,
                                                 anotherColor: anotherColorMap.darkColor,
                                                 factor: factor)
        return ColorMap(lightColor: lightColor,
                        darkColor: darkColor)
    }
    
    // MARK: - Interface methods
    /// Получить цвет
    /// - Parameter view: отображение для которого определяется цвет
    /// - Returns: цвет, подходящий цветовой схемею
    public func color(for view: UIView) -> UIColor {
        switch view.traitCollection.userInterfaceStyle {
        case .light, .unspecified: return lightColor
        case .dark: return darkColor
        @unknown default:
            assertionFailure("Not supported \(view.traitCollection.userInterfaceStyle)")
            return lightColor
        }
    }
}

public extension ColorMap {
    static var clear: ColorMap {
        ColorMap(color: .clear)
    }
}
