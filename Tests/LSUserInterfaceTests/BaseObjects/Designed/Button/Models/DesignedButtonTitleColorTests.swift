//
//  DesignedButtonTitleColorTests.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
@testable import LSUserInterface
// Apple
import XCTest

// MARK: - Constants
private let kNormalText = "Normal test"
private let kHighlightedText = "Highlighted test"
private let kDisabledText = "Disabled test"
private let kFontPointSize: CGFloat = 17.5

final class DesignedButtonTitleColorTests: XCTestCase {
    // MARK: - Data
    private var button: DesignedButton! = nil
    private var model: DesignedButtonTitleSet! = nil
    
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
        let font = UIFont.systemFont(ofSize: kFontPointSize, weight: .bold)
        model = DesignedButtonTitleSet(titleSet: .init(normalText: kNormalText,
                                                       highlightText: kHighlightedText,
                                                       disabledText: kDisabledText,
                                                       font: font,
                                                       numberOfLines: .multiline))
        // When
        model.apply(to: button)
        // Then
        XCTAssertEqual(button.title(for: .normal), kNormalText)
        XCTAssertEqual(button.title(for: .highlighted), kHighlightedText)
        XCTAssertEqual(button.title(for: .disabled), kDisabledText)
        XCTAssertEqual(button.titleLabel?.font.pointSize, kFontPointSize)
        XCTAssertEqual(button.titleLabel?.font.fontName, font.fontName)
    }
    
    func testThatNormalImageApplied() {
        // Given
        let font = UIFont.systemFont(ofSize: kFontPointSize, weight: .bold)
        model = DesignedButtonTitleSet(titleSet: .init(normalText: kNormalText,
                                                       font: font))
        // When
        model.apply(to: button)
        // Then
        XCTAssertEqual(button.title(for: .normal), kNormalText)
        XCTAssertEqual(button.title(for: .highlighted), kNormalText)
        XCTAssertEqual(button.title(for: .disabled), kNormalText)
        XCTAssertEqual(button.titleLabel?.font.pointSize, kFontPointSize)
        XCTAssertEqual(button.titleLabel?.font.fontName, font.fontName)
    }
}
