//
//  CollectionGridSizeBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 23.03.2023.
//

// Apple
import UIKit

final class CollectionGridSizeBehaviour: NSObject, CollectionSizeBehaviour {
    // MARK: - Data
    private let scrollDirection: UICollectionView.ScrollDirection
    private let itemsInRow: Int
    private let anotherSide: AnotherSideBehaviour
    private let obtainContentInset: () -> CGFloat
    private let obtainInterItemSpacing: () -> CGFloat
    
    // MARK: - Life cycle
    init(scrollDirection: UICollectionView.ScrollDirection,
         itemsInRow: Int,
         anotherSide: AnotherSideBehaviour,
         obtainContentInset: @escaping () -> CGFloat,
         obtainInterItemSpacing: @escaping () -> CGFloat) {
        self.scrollDirection = scrollDirection
        self.itemsInRow = itemsInRow
        self.anotherSide = anotherSide
        self.obtainContentInset = obtainContentInset
        self.obtainInterItemSpacing = obtainInterItemSpacing
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch scrollDirection {
        case .vertical:
            let allWidth = collectionView.bounds.width
            let availableWidth = allWidth - 2 * obtainContentInset() - CGFloat(itemsInRow - 1) * obtainInterItemSpacing()
            let width = floor(availableWidth / CGFloat(itemsInRow))
            return CGSize(width: width,
                          height: anotherSide.getValue(side: width))
        case .horizontal:
            let allHeight = collectionView.bounds.height
            let availableHeight = allHeight - 2 * obtainContentInset() - CGFloat(itemsInRow - 1) * obtainInterItemSpacing()
            let height = availableHeight / CGFloat(itemsInRow)
            return CGSize(width: anotherSide.getValue(side: height),
                          height: height)
        @unknown default:
            fatalError("New scroll direction appeared")
        }
    }
}

// MARK: - Subtypes
public enum AnotherSideBehaviour {
    case same
    case fixed(CGFloat)
    case proportionally(CGFloat)
    
    func getValue(side: CGFloat) -> CGFloat {
        switch self {
        case .same: return side
        case .fixed(let value): return value
        case .proportionally(let aspectRatio): return side * aspectRatio
        }
    }
}
