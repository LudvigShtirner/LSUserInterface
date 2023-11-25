//
//  UICollectionView+Validation.swift
//  
//
//  Created by Алексей Филиппов on 15.07.2023.
//

// Apple
import UIKit

public extension UICollectionView {
    func isValid(indexPath: IndexPath) -> Bool {
        guard indexPath.section < numberOfSections,
              indexPath.row < numberOfItems(inSection: indexPath.section) else {
            return false
        }
        return true
    }
}
