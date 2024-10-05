//
//  AnotherSideBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 24.03.2023.
//

// Apple
import UIKit

public enum AnotherSideBehaviour {
    case same
    case fixed(CGFloat)
    case proportionally(CGFloat)
    case basedOnConstraints(() -> UICollectionViewCell)
    case custom((CGFloat) -> CGFloat)
}

extension AnotherSideBehaviour {
    func getValue(side: CGFloat, horizontal: Bool) -> CGFloat {
        switch self {
        case .same: return side
        case .fixed(let value): return value
        case .proportionally(let aspectRatio): return side * aspectRatio
        case .basedOnConstraints(let cellProvider):
            if horizontal {
                let availableSize = CGSize(width: .greatestFiniteMagnitude,
                                           height: side)
                let size = cellProvider().systemLayoutSizeFitting(availableSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel,
                                                        verticalFittingPriority: .fittingSizeLevel)
                return ceil(size.width)
            } else {
                let availableSize = CGSize(width: side,
                                           height: .greatestFiniteMagnitude)
                let size = cellProvider().systemLayoutSizeFitting(availableSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel,
                                                        verticalFittingPriority: .fittingSizeLevel)
                return ceil(size.height)
            }
            
        case .custom(let provider): return provider(side)
        }
    }
}
