//
//  BackgroundColorTests.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

@testable import LSUserInterface
import SupportCode
// Apple
import XCTest

final class BackgroundColorTests: XCTestCase {
    // MARK: - Data
    private var view: BaseDesignedView! = nil
    private var model: BackgroundColor! = nil
    
    // MARK: - Overrides
    override func setUpWithError() throws {
        view = BaseDesignedView()
        let colorMap = ColorMap(lightColor: .red,
                                darkColor: .blue)
        model = BackgroundColor(colorMap: colorMap)
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
