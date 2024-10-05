//
//  CollectionCellSizeType.swift
//
//
//  Created by Алексей Филиппов on 25.09.2024.
//

// Apple
import UIKit

public enum CollectionCellSizeType {
    case fixedSize(CGSize)
    case fixedSide(CGFloat)
    case grid(Int, AnotherSideBehaviour)
}
