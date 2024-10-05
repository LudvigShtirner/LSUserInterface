//
//  CompositionalLayoutConfig.swift
//  
//
//  Created by Алексей Филиппов on 13.05.2023.
//

import UIKit

public extension CollectionViewLayoutType {
    struct CompositionalLayoutConfig {
        // MARK: - Data
        let scrollDirection: UICollectionView.ScrollDirection
        
        let makeLayout: () -> UICollectionViewCompositionalLayout
        
        // MARK: - Inits
        public init(scrollDirection: UICollectionView.ScrollDirection,
                    makeLayout: @escaping () -> UICollectionViewCompositionalLayout) {
            self.scrollDirection = scrollDirection
            self.makeLayout = makeLayout
        }
    }
}
