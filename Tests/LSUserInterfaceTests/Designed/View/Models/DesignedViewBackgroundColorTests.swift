//
//  DesignedViewBackgroundColorTests.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// SPM
@testable import LSUserInterface
// Apple
import XCTest

final class DesignedViewBackgroundColorTests: XCTestCase {
    // MARK: - Data
    private var view: DesignedView! = nil
    private var model: DesignedViewBackgroundColor! = nil
    
    // MARK: - Overrides
    override func setUpWithError() throws {
        view = DesignedView()
        let colorMap = ColorMap(lightColor: .red,
                                darkColor: .blue)
        model = DesignedViewBackgroundColor(value: .fixed(colorMap))
    }

    override func tearDownWithError() throws {
        view = nil
        model = nil
    }
    
    // MARK: - Tests
    func testThatBackgroundSetForLightTheme() {
        // Given
        view.overrideUserInterfaceStyle = .light
        // When
        model.apply(to: view)
        // Then
        XCTAssertEqual(view.backgroundColor, .red)
    }
    
    func testThatBackgroundSetForDarkTheme() {
        // Given
        view.overrideUserInterfaceStyle = .dark
        // When
        model.apply(to: view)
        // Then
        XCTAssertEqual(view.backgroundColor, .blue)
    }
}
