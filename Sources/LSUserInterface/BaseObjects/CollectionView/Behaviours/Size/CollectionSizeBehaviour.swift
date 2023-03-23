//
//  CollectionSizeBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 23.03.2023.
//

// Apple
import UIKit

protocol CollectionSizeBehaviour: UICollectionViewDelegateFlowLayout {
    
}

public enum CollectionSizeType {
    case empty
    case fixed(SizeCalculationType)
    case grid(Int, AnotherSideBehaviour)
}
