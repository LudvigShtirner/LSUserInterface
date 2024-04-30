//
//  CollectionViewDataProviderFactory.swift
//
//
//  Created by Алексей Филиппов on 21.04.2024.
//

// Apple
import Foundation

enum CollectionViewDataProviderFactory {
    static private let behaviourFactory = CollectionViewBehaviourFactory.self
    
    static func makeSimpleDataProvider<
        CellModel: BaseCollectionViewCellModel,
        Cell: BaseCollectionViewCellWithModel<CellModel>
    >(config: CollectionViewConfig<CellModel>,
      exampleCell: BaseCollectionViewCellWithModel<CellModel>,
      layoutType: CollectionViewLayoutType) -> SimpleModelDataProvider<CellModel, Cell> {
        let dataProvider = SimpleModelDataProvider<CellModel, Cell>()
        let getModel = { [weak dataProvider] indexPath in
            return dataProvider?.getModel(for: indexPath)
        }
        dataProvider.cellSizeBehaviour = behaviourFactory.makeCellSizeBehaviour(config: config,
                                                                                layoutType: layoutType,
                                                                                exampleCell: exampleCell,
                                                                                getModel: getModel)
        dataProvider.willDisplayCellBehaviour = behaviourFactory.makeWillDisplayCellBehaviour(config: config,
                                                                                              getModel: getModel)
        dataProvider.didSelectCellBehaviour = behaviourFactory.makeDidSelectCellBehaviour(config: config,
                                                                                          getModel: getModel)
        dataProvider.didScrollBehaviour = behaviourFactory.makeScrollDidScrollBehaviour(config: config)
        return dataProvider
    }
}
