//
//  LSCollectionViewCellCellModelErased.swift
//
//
//  Created by Алексей Филиппов on 28.07.2024.
//

// Apple
import UIKit

struct LSCollectionViewCellModelErased: Identifiable, Hashable {
    var id: String { model.id }
    
    private let model: any LSCollectionViewCellModel
    
    init(model: any LSCollectionViewCellModel) {
        self.model = model
    }
    
    func makeCell(collectionView: UICollectionView,
                  indexPath: IndexPath) -> UICollectionViewCell {
        model.makeCell(collectionView: collectionView,
                       indexPath: indexPath)
    }
    
    static func == (lhs: LSCollectionViewCellModelErased,
                    rhs: LSCollectionViewCellModelErased) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
