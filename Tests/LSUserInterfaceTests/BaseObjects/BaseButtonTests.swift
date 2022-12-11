//
//  BaseButtonTests.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
import LSUserInterface
// Apple
import XCTest

final class BaseButtonTests: XCTestCase {
    // MARK: - Tests
    func testExample() {
        // Given
        let button = BaseButton(type: .system)
        var touchUpInside = false
        var touchUpOutside = false
        var touchCancel = false
        
        button.shouldDo(on: .touchUpInside) { touchUpInside = true }
            .shouldDo(on: .touchUpOutside) { touchUpOutside = true }
            .shouldDo(on: .touchCancel) { touchCancel = true }
        // When
        button.sendActions(for: .touchUpInside)
        button.sendActions(for: .touchUpOutside)
        button.sendActions(for: .touchCancel)
        
        // Then
        XCTAssertTrue(touchUpInside)
        XCTAssertTrue(touchUpOutside)
        XCTAssertTrue(touchCancel)
    }
}
