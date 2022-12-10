//
//  BaseDesignedViewTests.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

@testable import LSUserInterface
// Apple
import XCTest

private let kCornerRadius: CGFloat = 6.0

final class BaseDesignedViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Tests
    func testThatAddedParameterApplied() {
        // Given
        let view = BaseDesignedView(frame: CGRect(origin: .zero,
                                                  size: CGSize(width: 100.0, height: 100.0)))
        // When
        view.addParameter(\.cornerRadius, with: kCornerRadius)
            .addParameter(\.border, with: (5.0, .init(lightColor: .red, darkColor: .blue)))
        // Then
        XCTAssertEqual(view.layer.cornerRadius, kCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, 5.0)
        XCTAssertEqual(view.layer.borderColor, UIColor.red.cgColor)
    }
}
