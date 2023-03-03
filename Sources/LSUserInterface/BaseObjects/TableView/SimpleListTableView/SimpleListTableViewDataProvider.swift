//
//  SimpleListTableViewDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 23.02.2023.
//

// Apple
import UIKit

final class SimpleListTableViewDataProvider<
    CellModel: BaseTableViewCellModel,
    Cell: BaseTableViewCellWithModel<CellModel>
>: NSObject, BaseTableViewDataProvider {
    // MARK: - Data
    private var selectAction: ((CellModel) -> Void)?
    private var deselectAction: ((CellModel) -> Void)?
    
    // MARK: - BaseTableViewDataProvider
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
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = getModel(for: indexPath)
        let cell: Cell = tableView.dequeueCell(for: indexPath)
        cell.bind(model)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let model = getModel(for: indexPath)
        selectAction?(model)
    }
    
    func tableView(_ tableView: UITableView,
                   didDeselectRowAt indexPath: IndexPath) {
        let model = getModel(for: indexPath)
        deselectAction?(model)
    }
}
