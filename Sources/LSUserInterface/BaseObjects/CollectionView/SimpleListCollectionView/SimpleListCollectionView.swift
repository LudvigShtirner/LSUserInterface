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
    private let dataProvider: SimpleListCollectionViewDataProvider<CellModel, Cell>
    
    // MARK: - Data
    public var models: [CellModel] {
        dataProvider.models
    }
    
    // MARK: - Life cycle
    public init(frame: CGRect,
                emptyView: EmptyView,
                loadingView: LoadingView,
                config: CollectionViewConfig) {
        let sizeBehaviour = SimpleListCollectionViewBehaviourFactory.makeSizeBehaviour(config: config)
        dataProvider = SimpleListCollectionViewDataProvider(sizeBehaviour: sizeBehaviour)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = config.scrollDirection
        layout.sectionInset = .init(top: .zero,
                                    left: config.inset,
                                    bottom: .zero,
                                    right: config.inset)
        layout.minimumLineSpacing = config.lineSpacing
        layout.minimumInteritemSpacing = config.itemSpacing
        super.init(frame: frame,
                   collectionViewLayout: layout,
                   emptyView: emptyView,
                   loadingView: loadingView)
        configureCollectionView()
    }
    
    public convenience init(emptyView: EmptyView,
                            loadingView: LoadingView,
                            config: CollectionViewConfig) {
        self.init(frame: .zero,
                  emptyView: emptyView,
                  loadingView: loadingView,
                  config: config)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Interface methods
    public func updateModels(_ models: [CellModel],
                             animated: Bool) {
        dataProvider.models = models
        reloadData()
        update(isLoading: false,
               isEmpty: models.isEmpty)
    }
    
    public func updateLoading(_ flag: Bool) {
        update(isLoading: flag,
               isEmpty: models.isEmpty)
    }
    
    // MARK: - Private methods
    private func configureCollectionView() {
        dataSource = dataProvider
        delegate = dataProvider
        registerCell(Cell.self)
    }
}

fileprivate struct SimpleListCollectionViewBehaviourFactory {
    static func makeSizeBehaviour(config: CollectionViewConfig) -> CollectionSizeBehaviour? {
        switch config.sizeType {
        case .empty:
            return nil
        case .fixed(let type):
            return CollectionFixedSizeBehaviour(sizeCalculationType: type)
        case .grid(let itemsInRow, let anotherSide):
            return CollectionGridSizeBehaviour(scrollDirection: config.scrollDirection,
                                               itemsInRow: itemsInRow,
                                               anotherSide: anotherSide,
                                               obtainContentInset: { return config.inset},
                                               obtainInterItemSpacing: {
                switch config.scrollDirection {
                case .horizontal:
                    return config.itemSpacing
                case .vertical:
                    return config.lineSpacing
                @unknown default:
                    fatalError("New scroll direction appeared")
                }
            })
        }
    }
}

public struct CollectionViewConfig {
    // MARK: - Data
    let scrollDirection: UICollectionView.ScrollDirection
    let inset: CGFloat
    let sizeType: CollectionSizeType
    let lineSpacing: CGFloat
    let itemSpacing: CGFloat
    
    // MARK: - Life cycle
    public init(scrollDirection: UICollectionView.ScrollDirection,
                sizeType: CollectionSizeType = .empty,
                inset: CGFloat,
                lineSpacing: CGFloat,
                itemSpacing: CGFloat) {
        self.scrollDirection = scrollDirection
        self.sizeType = sizeType
        self.inset = inset
        self.lineSpacing = lineSpacing
        self.itemSpacing = itemSpacing
    }
}
