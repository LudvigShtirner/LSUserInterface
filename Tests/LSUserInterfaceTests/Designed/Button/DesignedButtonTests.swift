//
//  DesignedButtonTests.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// SPM
import LSUserInterface
// Apple
import XCTest

private let kCornerRadius: CGFloat = 6.0
private let kBorderWidth: CGFloat = 5.0
private let kTestText = "Some text"
private let kFontSize = CGFloat(13)

final class DesignedButtonTests: XCTestCase {
    // MARK: - Tests
    func testThatAddedParameterApplied() {
        // Given
        let button = DesignedButton(frame: CGRect(origin: .zero,
                                                  size: CGSize(width: 100.0, height: 100.0)))
        // When
        button
            .usingCornerRadius(.fixed(kCornerRadius))
            .usingBorder(.changeable(width: kBorderWidth,
                                     colors: ColorSet(normal: ColorMap(lightColor: .red,
                                                                       darkColor: .blue))))
            .usingTintColor(.init(lightColor: .green, darkColor: .brown))
            .usingImageSet(.init(normalImage: .checkmark))
            .usingTitle(.init(normalText: kTestText))
            .usingFont(.systemFont(ofSize: kFontSize))
            .usingTitleColor(.init(normal: ColorMap(lightColor: .white,
                                                  darkColor: .black)) )
        // Then
        XCTAssertEqual(button.layer.cornerRadius, kCornerRadius)
        XCTAssertEqual(button.layer.borderWidth, kBorderWidth)
        XCTAssertEqual(button.layer.borderColor, UIColor.red.cgColor)
        XCTAssertEqual(button.tintColor, .green)
        XCTAssertEqual(button.image(for: .normal), .checkmark)
        XCTAssertEqual(button.title(for: .normal), kTestText)
        XCTAssertEqual(button.titleLabel?.font.pointSize, kFontSize)
        XCTAssertEqual(button.titleColor(for: .normal), .white)
    }
}
