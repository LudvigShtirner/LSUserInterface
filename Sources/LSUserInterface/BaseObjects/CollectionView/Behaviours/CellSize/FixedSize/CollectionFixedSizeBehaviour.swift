//
//  CollectionFixedSizeBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 23.03.2023.
//

// Apple
import UIKit

final class CollectionFixedSizeBehaviour: NSObject, CollectionCellSizeBehaviour {
    // MARK: - Data
    private let sizeCalculationType: SizeCalculationType
    
    // MARK: - Inits
    init(sizeCalculationType: SizeCalculationType) {
        self.sizeCalculationType = sizeCalculationType
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch sizeCalculationType {
        case .fixedSize(let size):
            return size
        case .fixedSide(let side, let scrollDirection):
            switch scrollDirection {
            case .horizontal:
                return CGSize(width: side,
                              height: collectionView.bounds.height)
            case .vertical:
                return CGSize(width: collectionView.bounds.width,
                              height: side)
            @unknown default:
                fatalError("nNew Scroll Direction appeared")
            }
        }
    }
}
