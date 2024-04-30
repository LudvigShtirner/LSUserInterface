//
//  SimpleListCollectionView.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// Apple
import UIKit

open class SimpleListCollectionView<
    CellModel: BaseCollectionViewCellModel,
    Cell: BaseCollectionViewCellWithModel<CellModel>,
    EmptyView: BaseView,
    LoadingView: BaseView
>: BaseCollectionView<EmptyView, LoadingView> {
    // MARK: - Dependencies
    private let dataProvider: SimpleModelDataProvider<CellModel, Cell>

    
    // MARK: - Inits
    public init(frame: CGRect = .zero,
                emptyView: EmptyView,
                loadingView: LoadingView,
                config: CollectionViewConfig<CellModel>,
                layoutType: CollectionViewLayoutType) {
        let layout = CollectionViewLayoutFactory.makeLayout(type: layoutType)
        self.dataProvider = CollectionViewDataProviderFactory.makeSimpleDataProvider(config: config, 
                                                                                     exampleCell: Cell.init(),
                                                                                     layoutType: layoutType)
        super.init(frame: frame,
                   collectionViewLayout: layout,
                   emptyView: emptyView,
                   loadingView: loadingView)
        
        dataSource = dataProvider
        delegate = dataProvider
        registerCell(Cell.self)
    }
    
    // MARK: - Interface methods
    public var models: [CellModel] {
        dataProvider.models
    }
    
    public func updateModels(_ models: [CellModel]) {
        dataProvider.models = models
        let isEmpty = models.isEmpty
        reloadData()
        update(isLoading: false,
               isEmpty: isEmpty)
    }
    
    public func updateLoading(_ flag: Bool) {
        update(isLoading: flag,
               isEmpty: models.isEmpty)
    }
}
