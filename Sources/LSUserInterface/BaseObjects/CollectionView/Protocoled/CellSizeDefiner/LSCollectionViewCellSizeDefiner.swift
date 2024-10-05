//
//  LSCollectionViewCellSizeDefiner.swift
//
//
//  Created by Алексей Филиппов on 11.08.2024.
//

// Apple
import UIKit

final class LSCollectionViewCellSizeDefiner {
    private let collectionView: UICollectionView
    private let cellSizeType: CollectionCellSizeType
    private let layoutType: CollectionViewLayoutType
    
    init(collectionView: UICollectionView,
         cellSizeType: CollectionCellSizeType,
         layoutType: CollectionViewLayoutType) {
        self.collectionView = collectionView
        self.cellSizeType = cellSizeType
        self.layoutType = layoutType
    }
    
    func defineSize(indexPath: IndexPath,
                    section: any LSCollectionViewSectionModel,
                    model: any LSCollectionViewCellModel) -> CGSize {
        switch cellSizeType {
        case .fixedSize(let size):
            return size
        case .fixedSide(let side):
            return calcSize(with: side)
        case .grid(let itemsInRow, let anotherSide):
            return calcGridSize(section: section,
                                model: model,
                                itemsInRow: itemsInRow,
                                anotherSide: anotherSide)
        }
    }
}

// MARK: - Private methods
private extension LSCollectionViewCellSizeDefiner {
    func calcSize(with side: CGFloat) -> CGSize {
        switch layoutType.scrollDirection {
        case .horizontal:
            return CGSize(width: side,
                          height: collectionView.bounds.height)
        case .vertical:
            return CGSize(width: collectionView.bounds.width,
                          height: side)
        @unknown default:
            assertionFailure("New Scroll Direction appeared")
            return .zero
        }
    }
    
    func calcGridSize(section: any LSCollectionViewSectionModel,
                      model: any LSCollectionViewCellModel,
                      itemsInRow: Int,
                      anotherSide: AnotherSideBehaviour) -> CGSize {
        let interItemSpacing = {
            switch layoutType.scrollDirection {
            case .horizontal:
                return section.itemSpacing
            case .vertical:
                return section.lineSpacing
            @unknown default:
                assertionFailure("New Scroll Direction appeared")
                return .zero
            }
        }()
        switch layoutType.scrollDirection {
        case .vertical:
            let allWidth = collectionView.bounds.width
            let availableWidth = allWidth - section.insets.horizontalInsets - CGFloat(itemsInRow - 1) * interItemSpacing
            let width = floor(availableWidth / CGFloat(itemsInRow))
            let height = anotherSide.getValue(side: width,
                                              horizontal: false)
            return CGSize(width: width,
                          height: height)
        case .horizontal:
            let allHeight = collectionView.bounds.height
            let availableHeight = allHeight - section.insets.horizontalInsets - CGFloat(itemsInRow - 1) * interItemSpacing
            let height = availableHeight / CGFloat(itemsInRow)
            let width = anotherSide.getValue(side: height,
                                             horizontal: true)
            return CGSize(width: width,
                          height: height)
        @unknown default:
            assertionFailure("New Scroll Direction appeared")
            return .zero
        }
    }
}
