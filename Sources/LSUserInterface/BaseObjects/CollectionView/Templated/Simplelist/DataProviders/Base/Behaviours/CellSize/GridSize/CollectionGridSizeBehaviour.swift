//
//  CollectionGridSizeBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 23.03.2023.
//

// Apple
import UIKit

final class CollectionGridSizeBehaviour<
    CellModel: BaseCollectionViewCellModel,
    Cell: BaseCollectionViewCellWithModel<CellModel>
>: NSObject, CollectionCellSizeBehaviour {
    // MARK: - Data
    private let scrollDirection: UICollectionView.ScrollDirection
    private let itemsInRow: Int
    private let anotherSide: AnotherSideBehaviour
    private let contentInset: CGFloat
    private let interItemSpacing: CGFloat
    private let getModel: (IndexPath) -> CellModel?
    
    private let exampleCell: Cell
    
    // MARK: - Inits
    init(scrollDirection: UICollectionView.ScrollDirection,
         itemsInRow: Int,
         anotherSide: AnotherSideBehaviour,
         contentInset: CGFloat,
         interItemSpacing: CGFloat,
         exampleCell: Cell,
         getModel: @escaping (IndexPath) -> CellModel?) {
        self.scrollDirection = scrollDirection
        self.itemsInRow = itemsInRow
        self.anotherSide = anotherSide
        self.contentInset = contentInset
        self.interItemSpacing = interItemSpacing
        self.exampleCell = exampleCell
        self.getModel = getModel
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let model = getModel(indexPath) else {
            assertionFailure("No model")
            return .zero
        }
        exampleCell.bind(model)
        switch scrollDirection {
        case .vertical:
            let allWidth = collectionView.bounds.width
            let availableWidth = allWidth - 2 * contentInset - CGFloat(itemsInRow - 1) * interItemSpacing
            let width = floor(availableWidth / CGFloat(itemsInRow))
            let height = anotherSide.getValue(side: width,
                                              cell: exampleCell,
                                              horizontal: false)
            return CGSize(width: width,
                          height: height)
        case .horizontal:
            let allHeight = collectionView.bounds.height
            let availableHeight = allHeight - 2 * contentInset - CGFloat(itemsInRow - 1) * interItemSpacing
            let height = availableHeight / CGFloat(itemsInRow)
            let width = anotherSide.getValue(side: height,
                                             cell: exampleCell,
                                             horizontal: true)
            return CGSize(width: width,
                          height: height)
        @unknown default:
            assertionFailure("New Scroll Direction appeared")
            return .zero
        }
    }
}
