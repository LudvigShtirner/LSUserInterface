//
//  CollectionViewBehaviourFactory.swift
//  
//
//  Created by Алексей Филиппов on 24.03.2023.
//

// Фззду
import Foundation

struct CollectionViewBehaviourFactory {
    static func makeCellSizeBehaviour<T: BaseCollectionViewCellModel>(config: CollectionViewConfig<T>,
                                                                      layoutConfig: CollectionViewLayoutConfig) -> CollectionCellSizeBehaviour? {
        switch config.cellSizeType {
        case .empty:
            return nil
        case .fixed(let type):
            return CollectionFixedSizeBehaviour(sizeCalculationType: type)
        case .grid(let itemsInRow, let anotherSide):
            let interItemSpacing = {
                switch layoutConfig.scrollDirection {
                case .horizontal:
                    return layoutConfig.itemSpacing
                case .vertical:
                    return layoutConfig.lineSpacing
                @unknown default:
                    fatalError("New scroll direction appeared")
                }
            }()
            return CollectionGridSizeBehaviour(scrollDirection: layoutConfig.scrollDirection,
                                               itemsInRow: itemsInRow,
                                               anotherSide: anotherSide,
                                               contentInset: layoutConfig.inset,
                                               interItemSpacing: interItemSpacing)
        }
    }
    
    static func makeWillDisplayCellBehaviour<T: BaseCollectionViewCellModel>(
        config: CollectionViewConfig<T>,
        getModel: @escaping (IndexPath) -> T?
    ) -> CollectionWillDisplayCellBehaviour? {
        
        switch config.willDisplayType {
        case .empty:
            return nil
        case .customAction(let customAction):
            return CollectionWillDisplayCellCustomActionBehaviour(getModel: getModel,
                                                                  customAction: customAction)
        }
    }
    
    static func makeDidSelectCellBehaviour<T: BaseCollectionViewCellModel>(
        config: CollectionViewConfig<T>,
        getModel: @escaping (IndexPath) -> T?
    ) -> CollectionViewDidSelectBehaviour? {
        
        switch config.didSelectType {
        case .empty:
            return nil
        case .customAction(let customAction):
            return CollectionViewDidSelectCustomActionBehaviour(getModel: getModel,
                                                                customAction: customAction)
        }
    }
    
    static func makeScrollDidScrollBehaviour<T: BaseCollectionViewCellModel>(config: CollectionViewConfig<T>) -> CollectionViewDidScrollBehaviour? {
        switch config.didScrollType {
        case .empty:
            return nil
        case .customAction(let customAction):
            return CollectionViewDidScrollCustomActionBehaviour(customAction: customAction)
        }
    }
}
