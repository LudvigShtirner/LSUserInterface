//
//  SimpleSectionTableViewDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 28.02.2023.
//

// Apple
import UIKit

final class SimpleSectionTableViewDataProvider<
    CellModel: BaseTableViewCellModel,
    Cell: BaseTableViewCellWithModel<CellModel>,
    ReusableModel: BaseTableViewReusableViewModel,
    ReusableView: BaseTableViewReusableViewWithModel<ReusableModel>
>: NSObject, BaseTableViewDataProvider {
    // MARK: - Data
    private var selectAction: ((CellModel) -> Void)?
    private var deselectAction: ((CellModel) -> Void)?
    
    // MARK: - BaseTableViewDataProvider
    typealias Model = CellModel

    var sections: [SectionModel<ReusableModel, CellModel>] = []
    
    func onSelect(_ closure: @escaping (CellModel) -> Void) {
        selectAction = closure
    }
    
    func onDeselect(_ closure: @escaping (CellModel) -> Void) {
        deselectAction = closure
    }
    
    // MARK: - Private methods
    private func getModel(for indexPath: IndexPath) -> CellModel {
        let section = sections[indexPath.section]
        return section.models[indexPath.row]
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let model = sections[section]
        return model.models.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = getModel(for: indexPath)
        let cell: Cell = tableView.dequeueCell(for: indexPath)
        cell.bind(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = sections[section]
        let reusableView: ReusableView = tableView.dequeueView()
        reusableView.bind(sectionModel.section)
        return reusableView
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

