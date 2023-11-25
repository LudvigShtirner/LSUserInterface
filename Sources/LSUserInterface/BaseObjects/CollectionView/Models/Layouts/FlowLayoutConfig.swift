//
//  FlowLayoutConfig.swift
//  
//
//  Created by Алексей Филиппов on 13.05.2023.
//

// Apple
import UIKit

public extension CollectionViewLayoutType {
    struct FlowLayoutConfig {
        // MARK: - Data
        let scrollDirection: UICollectionView.ScrollDirection
        let inset: CGFloat
        let lineSpacing: CGFloat
        let itemSpacing: CGFloat
        
        // MARK: - Inits
        public init(scrollDirection: UICollectionView.ScrollDirection,
                    inset: CGFloat = .zero,
                    lineSpacing: CGFloat = .zero,
                    itemSpacing: CGFloat = .zero) {
            self.scrollDirection = scrollDirection
            self.inset = inset
            self.lineSpacing = lineSpacing
            self.itemSpacing = itemSpacing
        }
    }
}
