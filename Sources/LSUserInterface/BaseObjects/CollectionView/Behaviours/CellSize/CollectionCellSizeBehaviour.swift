//
//  CollectionCellSizeBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 23.03.2023.
//

// Apple
import UIKit

protocol CollectionCellSizeBehaviour: UICollectionViewDelegateFlowLayout {
    
}

public enum CollectionCellSizeType {
    case empty
    case fixed(SizeCalculationType)
    case grid(Int, AnotherSideBehaviour)
}
