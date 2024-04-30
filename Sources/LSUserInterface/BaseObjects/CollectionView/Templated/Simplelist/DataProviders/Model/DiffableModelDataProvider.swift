//
//  DiffableModelDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 01.04.2023.
//

// Apple
import UIKit

final class DiffableModelDataProvider<
    CellModel: BaseCollectionViewCellModel,
    Cell: BaseCollectionViewCellWithModel<CellModel>
>: ModelDataProvider<CellModel> {
    // MARK: - Data
    private var dataSource: UICollectionViewDiffableDataSource<Section, CellModel>!
    private var currentSnapshot = NSDiffableDataSourceSnapshot<Section, CellModel>()
    
    // MARK: - Inits
    init(collectionView: UICollectionView) {
        super.init()
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView,
                                                        cellProvider: { [weak self] (collectionView, indexPath, itemIdentifier) in
            guard let self,
                  let model = self.getModel(for: indexPath) else {
                return UICollectionViewCell()
            }
            let cell: Cell = collectionView.dequeueCell(for: indexPath)
            cell.bind(model)
            return cell
        })
    }
    
    enum Section: Int {
        case main
    }
}
