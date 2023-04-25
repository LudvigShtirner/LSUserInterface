//
//  CollectionViewDidSelectCustomActionBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 26.03.2023.
//

// Apple
import UIKit

final class CollectionViewDidSelectCustomActionBehaviour<T: BaseCollectionViewCellModel>: NSObject, CollectionViewDidSelectBehaviour {
    // MARK: - Data
    private let getModel: (IndexPath) -> T?
    private let customAction: (T, IndexPath) -> Void
    
    // MARK: - Inits
    init(getModel: @escaping (IndexPath) -> T?,
         customAction: @escaping (T, IndexPath) -> Void) {
        self.getModel = getModel
        self.customAction = customAction
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        guard let model = getModel(indexPath) else {
            return
        }
        customAction(model, indexPath)
    }
}
