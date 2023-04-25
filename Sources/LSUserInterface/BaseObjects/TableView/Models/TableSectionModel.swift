//
//  TableSectionModel.swift
//  
//
//  Created by Алексей Филиппов on 26.02.2023.
//

// Apple
import UIKit

open class TableSectionModel<
    SectionViewModel: BaseTableViewReusableViewModel,
    CellModel: BaseTableViewCellModel
>: Hashable {
    // MARK: - Data
    let id: String
    let section: SectionViewModel
    let models: [CellModel]
    
    // MARK: - Inits
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
    public static func == (lhs: TableSectionModel<SectionViewModel, CellModel>,
                           rhs: TableSectionModel<SectionViewModel, CellModel>) -> Bool {
        return lhs.id == rhs.id
    }
}
