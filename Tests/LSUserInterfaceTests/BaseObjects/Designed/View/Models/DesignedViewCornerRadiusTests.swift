//
//  DesignedViewCornerRadiusTests.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

@testable import LSUserInterface
// Apple
import XCTest

private let kCornerRadius: CGFloat = 4.0

final class DesignedViewCornerRadiusTests: XCTestCase {
    // MARK: - Data
    private var view: DesignedView! = nil
    private var model: DesignedViewCornerRadius! = nil
    
    // MARK: - Overrides
    override func setUpWithError() throws {
        view = DesignedView()
        model = DesignedViewCornerRadius(value: kCornerRadius)
    }

    override func tearDownWithError() throws {
        view = nil
        model = nil
    }
    
    // MARK: - Tests
    func testThatCornerRadiusSet() {
        // Given
        view.overrideUserInterfaceStyle = .light
        // When
        model.apply(to: view)
        // Then
        XCTAssertEqual(view.layer.cornerRadius, kCornerRadius)
    }
}
