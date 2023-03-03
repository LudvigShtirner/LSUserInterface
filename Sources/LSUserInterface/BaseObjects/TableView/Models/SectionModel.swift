//
//  SectionModel.swift
//  
//
//  Created by Алексей Филиппов on 26.02.2023.
//

// Apple
import UIKit

open class SectionModel<
    SectionViewModel: BaseTableViewReusableViewModel,
    CellModel: BaseTableViewCellModel
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
    
    // MARK: - Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Equatable
    public static func == (lhs: SectionModel<SectionViewModel, CellModel>,
                           rhs: SectionModel<SectionViewModel, CellModel>) -> Bool {
        return lhs.id == rhs.id
    }
}
