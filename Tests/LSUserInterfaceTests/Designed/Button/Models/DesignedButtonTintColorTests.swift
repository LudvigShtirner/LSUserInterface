//
//  DesignedButtonTintColorTests.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
@testable import LSUserInterface
// Apple
import XCTest

final class DesignedButtonTintColorTests: XCTestCase {
    // MARK: - Data
    private var button: DesignedButton! = nil
    private var model: DesignedButtonTintColor! = nil
    
    // MARK: - Overrides
    override func setUpWithError() throws {
        button = DesignedButton()
        let colorMap = ColorMap(lightColor: .red,
                                darkColor: .blue)
        model = DesignedButtonTintColor(colorMap: colorMap)
    }

    override func tearDownWithError() throws {
        button = nil
        model = nil
    }
    
    // MARK: - Tests
    func testThatBackgroundSetForLightTheme() {
        // Given
        button.overrideUserInterfaceStyle = .light
        // When
        model.apply(to: button)
        // Then
        XCTAssertEqual(button.tintColor, .red)
    }
    
    func testThatBackgroundSetForDarkTheme() {
        // Given
        button.overrideUserInterfaceStyle = .dark
        if #available(iOS 17.0, *) {
            button.updateTraitsIfNeeded()
        }
        // When
        model.apply(to: button)
        // Then
        XCTAssertEqual(button.tintColor, .blue)
    }
}
