//
//  ModelDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 01.04.2023.
//

// Apple
import UIKit

class ModelDataProvider<
    CellModel: BaseCollectionViewCellModel
>: CollectionViewDelegatesProxy, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: - Data
    private(set) var models: [CellModel] = []
    
    // MARK: - Interface methods
    func getModel(for indexPath: IndexPath) -> CellModel {
        return models[indexPath.item]
    }
    
    func updateModels(_ models: [CellModel]) {
        self.models = models
    }
}
