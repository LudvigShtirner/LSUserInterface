//
//  SizeCalculationType.swift
//  
//
//  Created by Алексей Филиппов on 24.03.2023.
//

// Apple
import UIKit

// MARK: - Subtypes
public enum SizeCalculationType {
    case fixedSize(CGSize)
    case fixedSide(CGFloat, UICollectionView.ScrollDirection)
}
