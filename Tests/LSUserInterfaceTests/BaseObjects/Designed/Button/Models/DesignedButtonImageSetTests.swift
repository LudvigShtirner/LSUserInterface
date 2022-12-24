//
//  DesignedButtonImageSetTests.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
@testable import LSUserInterface
// Apple
import XCTest

final class DesignedButtonImageSetTests: XCTestCase {
    // MARK: - Data
    private var button: DesignedButton! = nil
    private var model: DesignedButtonImageSet! = nil
    
    // MARK: - Overrides
    override func setUpWithError() throws {
        button = DesignedButton()
    }

    override func tearDownWithError() throws {
        button = nil
        model = nil
    }
    
    // MARK: - Tests
    func testThatImagesApplied() {
        // Given
        model = DesignedButtonImageSet(imageSet: .init(normalImage: .remove,
                                                       highlightImage: .checkmark,
                                                       disabledImage: .actions))
        // When
        model.apply(to: button)
        // Then
        XCTAssertEqual(button.image(for: .normal), .remove)
        XCTAssertEqual(button.image(for: .highlighted), .checkmark)
        XCTAssertEqual(button.image(for: .disabled), .actions)
    }
    
    func testThatNormalImageApplied() {
        // Given
        model = DesignedButtonImageSet(imageSet: .init(normalImage: .remove))
        // When
        model.apply(to: button)
        // Then
        XCTAssertEqual(button.image(for: .normal), .remove)
        XCTAssertEqual(button.image(for: .highlighted), .remove)
        XCTAssertEqual(button.image(for: .disabled), .remove)
    }
}
