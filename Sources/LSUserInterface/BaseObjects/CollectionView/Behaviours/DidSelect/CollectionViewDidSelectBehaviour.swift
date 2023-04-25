//
//  CollectionViewDidSelectBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 26.03.2023.
//

// Apple
import UIKit

protocol CollectionViewDidSelectBehaviour: UICollectionViewDelegate {
    
}

public enum CollectionViewDidSelectBehaviourType<T: BaseCollectionViewCellModel> {
    case empty
    case customAction((T, IndexPath) -> Void)
}
