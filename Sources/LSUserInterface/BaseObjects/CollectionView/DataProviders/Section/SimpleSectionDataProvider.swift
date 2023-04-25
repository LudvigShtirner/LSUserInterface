//
//  SimpleSectionDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// Apple
import UIKit

final class SimpleSectionDataProvider<
    CellModel: BaseCollectionViewCellModel,
    Cell: BaseCollectionViewCellWithModel<CellModel>,
    SectionViewModel: BaseCollectionViewReusableViewModel,
    SectionModel: CollectionSectionModel<SectionViewModel, CellModel>
>: SectionDataProvider<CellModel, SectionViewModel, SectionModel>, UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        let section = sections[section]
        return section.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = getModel(for: indexPath)
        let cell: Cell = collectionView.dequeueCell(for: indexPath)
        cell.bind(model)
        return cell
    }
}
