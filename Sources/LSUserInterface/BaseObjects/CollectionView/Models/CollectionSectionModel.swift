//
//  CollectionSectionModel.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// Apple
import UIKit

open class CollectionSectionModel<
    SectionViewModel: BaseCollectionViewReusableViewModel,
    CellModel: BaseCollectionViewCellModel
>: Hashable {
    // MARK: - Data
    let id: String
    let section: SectionViewModel
    let models: [CellModel]
    
    // MARK: - Life cycle
    init(section: SectionViewModel,
         models: [CellModel]) {
        self.id = UUID().uuidString
        self.section = section
        self.models = models
    }
    
    // MARK: - Interface methods
    var isEmpty: Bool {
        models.isEmpty
    }
    
    // MARK: - Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Equatable
    public static func == (lhs: CollectionSectionModel<SectionViewModel, CellModel>,
                           rhs: CollectionSectionModel<SectionViewModel, CellModel>) -> Bool {
        return lhs.id == rhs.id
    }
}
