//
//  SectionDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 01.04.2023.
//

// Apple
import UIKit

class SectionDataProvider<
    CellModel: BaseCollectionViewCellModel,
    SectionViewModel: BaseCollectionViewReusableViewModel,
    SectionModel: CollectionSectionModel<SectionViewModel, CellModel>
>: CollectionViewDelegatesProxy, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: - Data
    private(set) var sections: [SectionModel] = []
    
    // MARK: - Interface methods
    func getModel(for indexPath: IndexPath) -> CellModel {
        let section = sections[indexPath.section]
        return section.models[indexPath.item]
    }
    
    func updateModels(_ sections: [SectionModel]) {
        self.sections = sections
    }
}
