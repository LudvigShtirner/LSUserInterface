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
        case .flow(let scrollDirection):
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = scrollDirection
            return layout
        case .compositional(let config):
            return config.makeLayout()
        }
    }
}
