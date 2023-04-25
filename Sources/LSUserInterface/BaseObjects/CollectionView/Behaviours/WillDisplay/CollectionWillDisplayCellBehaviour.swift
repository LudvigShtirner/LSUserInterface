//
//  CollectionWillDisplayCellBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 24.03.2023.
//

// Apple
import UIKit

protocol CollectionWillDisplayCellBehaviour: UICollectionViewDelegate {
    
}

public enum CollectionWillDisplayCellType<T: BaseCollectionViewCellModel> {
    case empty
    case customAction((T, IndexPath) -> Void)
}
