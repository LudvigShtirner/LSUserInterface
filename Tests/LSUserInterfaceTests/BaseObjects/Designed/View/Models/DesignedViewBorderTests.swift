//
//  DesignedViewBorderTests.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

@testable import LSUserInterface
import SupportCode
// Apple
import XCTest

private let kBorderWidth: CGFloat = 4.0

final class DesignedViewBorderTests: XCTestCase {
    // MARK: - Data
    private var view: DesignedView! = nil
    private var model: DesignedViewBorder! = nil
    
    // MARK: - Overrides
    override func setUpWithError() throws {
        view = DesignedView()
        let colorMap = ColorMap(lightColor: .red,
                                darkColor: .blue)
        model = DesignedViewBorder(width: kBorderWidth,
                                   colorMap: colorMap)
    }

    override func tearDownWithError() throws {
        view = nil
        model = nil
    }
    
    // MARK: - Tests
    func testThatBorderSetForLightTheme() {
        // Given
        view.overrideUserInterfaceStyle = .light
        // When
        model.apply(to: view)
        // Then
        XCTAssertEqual(view.layer.borderWidth, kBorderWidth)
        XCTAssertEqual(view.layer.borderColor, UIColor.red.cgColor)
    }
    
    func testThatBorderSetForDarkTheme() {
        // Given
        view.overrideUserInterfaceStyle = .dark
        // When
        model.apply(to: view)
        // Then
        XCTAssertEqual(view.layer.borderWidth, kBorderWidth)
        XCTAssertEqual(view.layer.borderColor, UIColor.blue.cgColor)
    }
}