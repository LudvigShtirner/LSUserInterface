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
    var sections: [SectionModel] = []
    
    // MARK: - Interface methods
    func getModel(for indexPath: IndexPath) -> CellModel? {
        let section = sections[safe: indexPath.section]
        return section?.models[safe: indexPath.item]
    }
}
