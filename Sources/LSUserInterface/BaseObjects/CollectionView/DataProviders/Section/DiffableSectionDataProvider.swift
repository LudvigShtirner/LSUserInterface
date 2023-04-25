//
//  DiffableSectionDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 31.03.2023.
//

// Apple
import UIKit

final class DiffableSectionDataProvider<
    CellModel: BaseCollectionViewCellModel,
    Cell: BaseCollectionViewCellWithModel<CellModel>,
    SectionViewModel: BaseCollectionViewReusableViewModel,
    SectionModel: CollectionSectionModel<SectionViewModel, CellModel>
>: SectionDataProvider<CellModel, SectionViewModel, SectionModel> {
    // MARK: - Data
    private var dataSource: UICollectionViewDiffableDataSource<SectionViewModel, CellModel>!
    private var currentSnapshot = NSDiffableDataSourceSnapshot<SectionViewModel, CellModel>()
    
    // MARK: - Inits
    init(collectionView: UICollectionView) {
        super.init()
        dataSource = .init(collectionView: collectionView,
                           cellProvider: { [weak self] (collectionView, indexPath, itemIdentifier) in
            guard let self else {
                return UICollectionViewCell()
            }
            let model = self.getModel(for: indexPath)
            let cell: Cell = collectionView.dequeueCell(for: indexPath)
            cell.bind(model)
            return cell
        })
    }
}
