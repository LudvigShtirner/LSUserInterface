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
        let inset: CGFloat
        let lineSpacing: CGFloat
        let itemSpacing: CGFloat
        
        let makeLayout: () -> UICollectionViewCompositionalLayout
        
        // MARK: - Inits
        public init(scrollDirection: UICollectionView.ScrollDirection,
                    inset: CGFloat = .zero,
                    lineSpacing: CGFloat = .zero,
                    itemSpacing: CGFloat = .zero,
                    makeLayout: @escaping () -> UICollectionViewCompositionalLayout) {
            self.scrollDirection = scrollDirection
            self.inset = inset
            self.lineSpacing = lineSpacing
            self.itemSpacing = itemSpacing
            self.makeLayout = makeLayout
        }
    }
}
