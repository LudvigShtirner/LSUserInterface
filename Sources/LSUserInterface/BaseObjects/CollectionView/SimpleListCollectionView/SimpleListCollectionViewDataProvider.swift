//
//  SimpleListCollectionViewDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// Apple
import UIKit

final class SimpleListCollectionViewDataProvider<
    CellModel: BaseCollectionViewCellModel,
    Cell: BaseCollectionViewCellWithModel<CellModel>
>: NSObject, BaseCollectionViewDataProvider {
    // MARK: - Dependencies
    private var sizeBehaviour: CollectionSizeBehaviour?
    
    // MARK: - Data
    private var selectAction: ((CellModel) -> Void)?
    private var deselectAction: ((CellModel) -> Void)?
    
    // MARK: - Life cycle
    init(sizeBehaviour: CollectionSizeBehaviour?) {
        self.sizeBehaviour = sizeBehaviour
    }
    
    // MARK: - BaseCollectionViewDataProvider
    typealias Model = CellModel

    var models: [CellModel] = []
    
    func onSelect(_ closure: @escaping (CellModel) -> Void) {
        selectAction = closure
    }
    
    func onDeselect(_ closure: @escaping (CellModel) -> Void) {
        deselectAction = closure
    }
    
    // MARK: - Private methods
    private func getModel(for indexPath: IndexPath) -> CellModel {
        models[indexPath.row]
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = getModel(for: indexPath)
        let cell: Cell = collectionView.dequeueCell(for: indexPath)
        cell.bind(model)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let model = getModel(for: indexPath)
        selectAction?(model)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
        let model = getModel(for: indexPath)
        deselectAction?(model)
    }
    
    // MARK: - Message dispatch Overriding
    override func responds(to aSelector: Selector!) -> Bool {
        if aSelector.description == "collectionView:layout:sizeForItemAtIndexPath:" {
            return sizeBehaviour != nil
        }
        return super.responds(to: aSelector)
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        guard let behaviour = sizeBehaviour,
              behaviour.responds(to: aSelector) else {
            return nil
        }
        return behaviour
    }
}
