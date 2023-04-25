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
    private var dataProvider: ModelDataProvider<CellModel>?
    
    // MARK: - Data
    private let layoutConfig: CollectionViewLayoutConfig
    
    public var models: [CellModel] {
        dataProvider?.models ?? []
    }
    
    // MARK: - Inits
    public init(frame: CGRect,
                emptyView: EmptyView,
                loadingView: LoadingView,
                layoutConfig: CollectionViewLayoutConfig) {
        self.layoutConfig = layoutConfig
        let layout = Self.makeLayout(config: layoutConfig)
        super.init(frame: frame,
                   collectionViewLayout: layout,
                   emptyView: emptyView,
                   loadingView: loadingView)
    }
    
    public convenience init(emptyView: EmptyView,
                            loadingView: LoadingView,
                            layoutConfig: CollectionViewLayoutConfig) {
        self.init(frame: .zero,
                  emptyView: emptyView,
                  loadingView: loadingView,
                  layoutConfig: layoutConfig)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Interface methods
    public func configure(config: CollectionViewConfig<CellModel>) {
        dataProvider = makeDataProvider(config: config,
                                        layoutConfig: layoutConfig)
        delegate = dataProvider
        registerCell(Cell.self)
    }
    
    public func updateModels(_ models: [CellModel]) {
        dataProvider?.updateModels(models)
        reloadData()
        update(isLoading: false,
               isEmpty: models.isEmpty)
    }
    
    public func updateLoading(_ flag: Bool) {
        update(isLoading: flag,
               isEmpty: models.isEmpty)
    }
    
    // MARK: - Private methods
    private func makeDataProvider(config: CollectionViewConfig<CellModel>,
                                  layoutConfig: CollectionViewLayoutConfig) -> ModelDataProvider<CellModel> {
        let dataProvider = SimpleModelDataProvider<CellModel, Cell>()
        dataSource = dataProvider
        
        let getModel = { [weak dataProvider] indexPath in
            return dataProvider?.getModel(for: indexPath)
        }
        dataProvider.cellSizeBehaviour = CollectionViewBehaviourFactory.makeCellSizeBehaviour(config: config,
                                                                                              layoutConfig: layoutConfig)
        dataProvider.willDisplayCellBehaviour = CollectionViewBehaviourFactory.makeWillDisplayCellBehaviour(config: config,
                                                                                                            getModel: getModel)
        dataProvider.didSelectCellBehaviour = CollectionViewBehaviourFactory.makeDidSelectCellBehaviour(config: config,
                                                                                                        getModel: getModel)
        dataProvider.didScrollBehaviour = CollectionViewBehaviourFactory.makeScrollDidScrollBehaviour(config: config)
        
        
        return dataProvider
    }
    
    private static func makeLayout(config: CollectionViewLayoutConfig) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = config.scrollDirection
        layout.sectionInset = .init(top: .zero,
                                    left: config.inset,
                                    bottom: .zero,
                                    right: config.inset)
        layout.minimumLineSpacing = config.lineSpacing
        layout.minimumInteritemSpacing = config.itemSpacing
        return layout
    }
}
