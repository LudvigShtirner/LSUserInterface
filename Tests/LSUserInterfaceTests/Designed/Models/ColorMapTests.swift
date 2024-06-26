//
//  ColorMapTests.swift
//  
//
//  Created by Алексей Филиппов on 11.11.2022.
//

// SPM
@testable import LSUserInterface
// Apple
import XCTest

final class ColorMapTests: XCTestCase {
    // MARK: - Data
    private let yellowColor = UIColor.yellow
    private let redColor = UIColor.red
    
    // MARK: - Tests
    func testThatColorMapReturnsLightColor() {
        // Given
        let view = UIView()
        view.overrideUserInterfaceStyle = .light
        let map = ColorMap(lightColor: yellowColor,
                           darkColor: redColor)
        // When
        let color = map.color(for: view)
        // Then
        XCTAssertEqual(color, yellowColor)
    }
    
    func testThatColorMapReturnsDarkColor() {
        // Given
        let view = UIView()
        view.overrideUserInterfaceStyle = .dark
        if #available(iOS 17.0, *) {
            view.updateTraitsIfNeeded()
        }
        let map = ColorMap(lightColor: yellowColor,
                           darkColor: redColor)
        // When
        let color = map.color(for: view)
        // Then
        XCTAssertEqual(color, redColor)
    }
    
    func testThatColorMapReturnsSameColors() {
        // Given
        let view = UIView()
        
        let map = ColorMap(color: redColor)
        // When
        view.overrideUserInterfaceStyle = .light
        let lightColor = map.color(for: view)
        view.overrideUserInterfaceStyle = .dark
        let darkColor = map.color(for: view)
        // Then
        XCTAssertEqual(lightColor, redColor)
        XCTAssertEqual(darkColor, redColor)
    }
}
