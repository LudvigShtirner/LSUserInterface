//
//  CollectionViewLayoutType.swift
//  
//
//  Created by Алексей Филиппов on 13.05.2023.
//

// Apple
import UIKit

public enum CollectionViewLayoutType {
    case flow(UICollectionView.ScrollDirection)
    case compositional(CompositionalLayoutConfig)
    
    var scrollDirection: UICollectionView.ScrollDirection {
        switch self {
        case .flow(let scrollDirection):
            return scrollDirection
        case .compositional(let config):
            return config.scrollDirection
        }
    }
}
