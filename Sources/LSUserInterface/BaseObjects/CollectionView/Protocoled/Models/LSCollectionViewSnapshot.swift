//
//  LSCollectionViewSnapshot.swift
//
//
//  Created by Алексей Филиппов on 04.08.2024.
//

// Apple
import Foundation

public struct LSCollectionViewSnapshot {
    public var sections: [any LSCollectionViewSectionModel]
    
    public init(sections: [any LSCollectionViewSectionModel] = []) {
        self.sections = sections
    }
    
    public var isEmpty: Bool {
        sections.first { $0.models.isEmpty == false } == nil
    }
}
