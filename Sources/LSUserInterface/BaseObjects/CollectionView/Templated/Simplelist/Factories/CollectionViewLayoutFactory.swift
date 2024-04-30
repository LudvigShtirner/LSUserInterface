//
//  CollectionViewLayoutFactory.swift
//
//
//  Created by Алексей Филиппов on 21.04.2024.
//

// Apple
import UIKit

enum CollectionViewLayoutFactory {
    static func makeLayout(type: CollectionViewLayoutType) -> UICollectionViewLayout {
        switch type {
        case .flow(let config):
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = config.scrollDirection
            layout.sectionInset = UIEdgeInsets(top: .zero,
                                               left: config.inset,
                                               bottom: .zero,
                                               right: config.inset)
            layout.minimumLineSpacing = config.lineSpacing
            layout.minimumInteritemSpacing = config.itemSpacing
            return layout
        case .compositional(let config):
            return config.makeLayout()
        }
    }
}
