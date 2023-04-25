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
    
    func getValue(side: CGFloat) -> CGFloat {
        switch self {
        case .same: return side
        case .fixed(let value): return value
        case .proportionally(let aspectRatio): return side * aspectRatio
        }
    }
}
