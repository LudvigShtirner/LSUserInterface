//
//  CollectionViewLayoutType.swift
//  
//
//  Created by Алексей Филиппов on 13.05.2023.
//

// Apple
import UIKit

public enum CollectionViewLayoutType {
    case flow(FlowLayoutConfig)
    case compositional(CompositionalLayoutConfig)
    
    var scrollDirection: UICollectionView.ScrollDirection {
        switch self {
        case .flow(let config):
            return config.scrollDirection
        case .compositional(let config):
            return config.scrollDirection
        }
    }
    var inset: CGFloat {
        switch self {
        case .flow(let config):
            return config.inset
        case .compositional(let config):
            return config.inset
        }
    }
    var lineSpacing: CGFloat {
        switch self {
        case .flow(let config):
            return config.lineSpacing
        case .compositional(let config):
            return config.lineSpacing
        }
    }
    var itemSpacing: CGFloat {
        switch self {
        case .flow(let config):
            return config.itemSpacing
        case .compositional(let config):
            return config.itemSpacing
        }
    }
}
