//
//  CollectionViewConfig.swift
//  
//
//  Created by Алексей Филиппов on 24.03.2023.
//

// Apple
import UIKit

public struct CollectionViewConfig<T: BaseCollectionViewCellModel> {
    // MARK: - Data
    let cellSizeType: CollectionCellSizeType
    let willDisplayType: CollectionWillDisplayCellType<T>
    let didSelectType: CollectionViewDidSelectBehaviourType<T>
    let didScrollType: CollectionViewDidScrollBehaviourType
    
    // MARK: - Inits
    public init(cellSizeType: CollectionCellSizeType = .empty,
                willDisplayType: CollectionWillDisplayCellType<T> = .empty,
                didSelectType: CollectionViewDidSelectBehaviourType<T> = .empty,
                didScrollType: CollectionViewDidScrollBehaviourType = .empty) {
        self.cellSizeType = cellSizeType
        self.willDisplayType = willDisplayType
        self.didSelectType = didSelectType
        self.didScrollType = didScrollType
    }
}
