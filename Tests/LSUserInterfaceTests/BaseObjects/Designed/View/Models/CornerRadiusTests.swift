//
//  CornerRadiusTests.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

@testable import LSUserInterface
// Apple
import XCTest

private let kCornerRadius: CGFloat = 4.0

final class CornerRadiusTests: XCTestCase {
    // MARK: - Data
    private var view: BaseDesignedView! = nil
    private var model: CornerRadius! = nil
    
    // MARK: - Overrides
    override func setUpWithError() throws {
        view = BaseDesignedView()
        model = CornerRadius(value: kCornerRadius)
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
