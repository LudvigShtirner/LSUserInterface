//
//  DesignedViewTests.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// SPM
import LSUserInterface
// Apple
import XCTest

private let kCornerRadius: CGFloat = 6.0
private let kBorderWidth: CGFloat = 5.0

final class DesignedViewTests: XCTestCase {
    // MARK: - Tests
    func testThatAddedParameterApplied() {
        // Given
        let view = DesignedView(frame: CGRect(origin: .zero,
                                              size: CGSize(width: 100.0, height: 100.0)))
        // When
        view.setParameter(\.cornerRadius, with: .fixed(kCornerRadius))
            .setParameter(\.border, with: .init(width: kBorderWidth,
                                                colorMap:  .init(lightColor: .red,
                                                                 darkColor: .blue)))
        // Then
        XCTAssertEqual(view.layer.cornerRadius, kCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, kBorderWidth)
        XCTAssertEqual(view.layer.borderColor, UIColor.red.cgColor)
    }
}
