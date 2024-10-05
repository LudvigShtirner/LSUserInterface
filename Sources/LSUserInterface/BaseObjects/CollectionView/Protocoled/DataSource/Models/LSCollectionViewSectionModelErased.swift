//
//  LSCollectionViewSectionModelErased.swift
//  
//
//  Created by Алексей Филиппов on 28.07.2024.
//

// Apple
import Foundation

struct LSCollectionViewSectionModelErased: Identifiable, Hashable {
    let id: String
    
    let models: [any LSCollectionViewCellModel]
    
    static func == (lhs: LSCollectionViewSectionModelErased,
                    rhs: LSCollectionViewSectionModelErased) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
