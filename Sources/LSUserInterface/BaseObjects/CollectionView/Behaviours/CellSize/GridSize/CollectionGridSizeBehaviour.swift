//
//  CollectionGridSizeBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 23.03.2023.
//

// Apple
import UIKit

final class CollectionGridSizeBehaviour: NSObject, CollectionCellSizeBehaviour {
    // MARK: - Data
    private let scrollDirection: UICollectionView.ScrollDirection
    private let itemsInRow: Int
    private let anotherSide: AnotherSideBehaviour
    private let contentInset: CGFloat
    private let interItemSpacing: CGFloat
    
    // MARK: - Inits
    init(scrollDirection: UICollectionView.ScrollDirection,
         itemsInRow: Int,
         anotherSide: AnotherSideBehaviour,
         contentInset: CGFloat,
         interItemSpacing: CGFloat) {
        self.scrollDirection = scrollDirection
        self.itemsInRow = itemsInRow
        self.anotherSide = anotherSide
        self.contentInset = contentInset
        self.interItemSpacing = interItemSpacing
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch scrollDirection {
        case .vertical:
            let allWidth = collectionView.bounds.width
            let availableWidth = allWidth - 2 * contentInset - CGFloat(itemsInRow - 1) * interItemSpacing
            let width = floor(availableWidth / CGFloat(itemsInRow))
            return CGSize(width: width,
                          height: anotherSide.getValue(side: width))
        case .horizontal:
            let allHeight = collectionView.bounds.height
            let availableHeight = allHeight - 2 * contentInset - CGFloat(itemsInRow - 1) * interItemSpacing
            let height = availableHeight / CGFloat(itemsInRow)
            return CGSize(width: anotherSide.getValue(side: height),
                          height: height)
        @unknown default:
            fatalError("New scroll direction appeared")
        }
    }
}
