//
//  CollectionViewDidScrollCustomActionBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 26.03.2023.
//

// Apple
import UIKit

final class CollectionViewDidScrollCustomActionBehaviour: NSObject, CollectionViewDidScrollBehaviour {
    // MARK: - Data
    private let customAction: (CGPoint) -> Void
    
    // MARK: - Inits
    init(customAction: @escaping (CGPoint) -> Void) {
        self.customAction = customAction
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customAction(scrollView.contentOffset)
    }
}
