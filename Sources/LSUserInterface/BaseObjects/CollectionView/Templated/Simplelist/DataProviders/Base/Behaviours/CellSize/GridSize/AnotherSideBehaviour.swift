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
    case basedOnConstraints
    case custom((CGFloat) -> CGFloat)
}

extension AnotherSideBehaviour {
    func getValue<Cell: BaseCollectionViewCell>(side: CGFloat,
                                                cell: Cell,
                                                horizontal: Bool) -> CGFloat {
        switch self {
        case .same: return side
        case .fixed(let value): return value
        case .proportionally(let aspectRatio): return side * aspectRatio
        case .basedOnConstraints:
            if horizontal {
                let availableSize = CGSize(width: .greatestFiniteMagnitude,
                                           height: side)
                let size = cell.systemLayoutSizeFitting(availableSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel,
                                                        verticalFittingPriority: .fittingSizeLevel)
                return ceil(size.width)
            } else {
                let availableSize = CGSize(width: side,
                                           height: .greatestFiniteMagnitude)
                let size = cell.systemLayoutSizeFitting(availableSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel,
                                                        verticalFittingPriority: .fittingSizeLevel)
                return ceil(size.height)
            }
            
        case .custom(let provider): return provider(side)
        }
    }
}
