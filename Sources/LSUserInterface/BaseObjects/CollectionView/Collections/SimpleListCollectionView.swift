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
    private let layoutType: CollectionViewLayoutType
    
    public var models: [CellModel] {
        dataProvider?.models ?? []
    }
    
    // MARK: - Inits
    public init(frame: CGRect,
                emptyView: EmptyView,
                loadingView: LoadingView,
                layoutType: CollectionViewLayoutType) {
        self.layoutType = layoutType
        let layout = Self.makeLayout(type: layoutType)
        super.init(frame: frame,
                   collectionViewLayout: layout,
                   emptyView: emptyView,
                   loadingView: loadingView)
    }
    
    public convenience init(emptyView: EmptyView,
                            loadingView: LoadingView,
                            layoutType: CollectionViewLayoutType) {
        self.init(frame: .zero,
                  emptyView: emptyView,
                  loadingView: loadingView,
                  layoutType: layoutType)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Interface methods
    public func configure(config: CollectionViewConfig<CellModel>) {
        dataProvider = makeDataProvider(config: config,
                                        layoutType: layoutType)
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
                                  layoutType: CollectionViewLayoutType) -> ModelDataProvider<CellModel> {
        let dataProvider = SimpleModelDataProvider<CellModel, Cell>()
        dataSource = dataProvider
        
        let getModel = { [weak dataProvider] indexPath in
            return dataProvider?.getModel(for: indexPath)
        }
        dataProvider.cellSizeBehaviour = CollectionViewBehaviourFactory.makeCellSizeBehaviour(config: config,
                                                                                              layoutType: layoutType)
        dataProvider.willDisplayCellBehaviour = CollectionViewBehaviourFactory.makeWillDisplayCellBehaviour(config: config,
                                                                                                            getModel: getModel)
        dataProvider.didSelectCellBehaviour = CollectionViewBehaviourFactory.makeDidSelectCellBehaviour(config: config,
                                                                                                        getModel: getModel)
        dataProvider.didScrollBehaviour = CollectionViewBehaviourFactory.makeScrollDidScrollBehaviour(config: config)
        
        
        return dataProvider
    }
    
    private static func makeLayout(type: CollectionViewLayoutType) -> UICollectionViewLayout {
        switch type {
        case .flow(let config):
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = config.scrollDirection
            layout.sectionInset = .init(top: .zero,
                                        left: config.inset,
                                        bottom: .zero,
                                        right: config.inset)
            layout.minimumLineSpacing = config.lineSpacing
            layout.minimumInteritemSpacing = config.itemSpacing
            return layout
        case .compositional(let config):
            return config.makeLayout()
        }
    }
}
