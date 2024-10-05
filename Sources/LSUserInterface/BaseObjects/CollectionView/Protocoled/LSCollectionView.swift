//
//  LSCollectionView.swift
//
//
//  Created by Алексей Филиппов on 28.07.2024.
//

// Apple
import UIKit

open class LSCollectionView<
    EmptyView: BaseView,
    LoadingView: BaseView
>: BaseCollectionView<EmptyView, LoadingView> {
    // MARK: Dependencies
    private var dataProvider: LSCollectionViewDataSource!
    
    // MARK: Life cycle
    public init(frame: CGRect = .zero,
                emptyView: EmptyView,
                loadingView: LoadingView,
                layoutType: CollectionViewLayoutType,
                cellSizeType: CollectionCellSizeType) {
        let layout = CollectionViewLayoutFactory.makeLayout(type: layoutType)
        super.init(frame: frame,
                   collectionViewLayout: layout,
                   emptyView: emptyView,
                   loadingView: loadingView)
        self.dataProvider = LSCollectionViewDataSourceBase(collectionView: self, 
                                                           cellSizeType: cellSizeType,
                                                           layoutType: layoutType)
    }
    
    // MARK: - Interface methods
    public func reloadAll(sections: [any LSCollectionViewSectionModel]) {
        let snapshot = LSCollectionViewSnapshot(sections: sections)
        dataProvider.reloadAll(with: snapshot)
        update(isLoading: false,
               isEmpty: dataProvider.isEmpty)
    }
    
    public func reloadCell(with model: any LSCollectionViewCellModel) {
        dataProvider.reloadCell(with: model)
    }
    
    public func updateLoading(_ flag: Bool) {
        update(isLoading: flag,
               isEmpty: dataProvider.isEmpty)
    }
}
