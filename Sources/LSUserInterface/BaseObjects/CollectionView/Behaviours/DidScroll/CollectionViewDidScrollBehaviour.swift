//
//  CollectionViewDidScrollBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 26.03.2023.
//

// Apple
import UIKit

protocol CollectionViewDidScrollBehaviour: UIScrollViewDelegate {
    
}

public enum CollectionViewDidScrollBehaviourType {
    case empty
    case customAction((CGPoint) -> Void)
}
