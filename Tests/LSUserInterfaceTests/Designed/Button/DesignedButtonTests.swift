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
        button.setParameter(\.cornerRadius, with: .fixed(kCornerRadius))
            .setParameter(\.border, with: .changeable(kBorderWidth, ColorSet(normal: ColorMap(lightColor: .red,
                                                                                              darkColor: .blue))))
            .setParameter(\.tintColor, with: ColorMap(lightColor: .green, darkColor: .brown))
            .setParameter(\.imageSet, with: ImageSet(normalImage: .checkmark))
            .setParameter(\.titleSet, with: TitleSet(normalText: kTestText))
            .setParameter(\.font, with: .systemFont(ofSize: kFontSize))
            .setParameter(\.titleColor, with: ColorSet(normal: ColorMap(lightColor: .white,
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
