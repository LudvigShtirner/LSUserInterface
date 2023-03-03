//
//  SimpleListTableView.swift
//  
//
//  Created by Алексей Филиппов on 25.02.2023.
//

// Apple
import UIKit

open class SimpleListTableView<
    CellModel: BaseTableViewCellModel,
    Cell: BaseTableViewCellWithModel<CellModel>
>: BaseTableView {
    // MARK: - Dependencies
    private let dataProvider: SimpleListTableViewDataProvider<CellModel, Cell>
    
    // MARK: - Data
    public var models: [CellModel] {
        get { dataProvider.models }
        set {
            dataProvider.models = newValue
            reloadData()
        }
    }
    
    // MARK: - Life cycle
    public override init(frame: CGRect,
                         style: UITableView.Style) {
        dataProvider = SimpleListTableViewDataProvider()
        super.init(frame: frame, style: style)
        configureTableView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureTableView() {
        dataSource = dataProvider
        delegate = dataProvider
        registerCell(Cell.self)
    }
}
