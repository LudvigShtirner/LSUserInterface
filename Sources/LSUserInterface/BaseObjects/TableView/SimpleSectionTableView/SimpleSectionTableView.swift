//
//  SimpleSectionTableView.swift
//  
//
//  Created by Алексей Филиппов on 28.02.2023.
//

// Apple
import UIKit

open class SimpleSectionTableView<
    CellModel: BaseTableViewCellModel,
    Cell: BaseTableViewCellWithModel<CellModel>,
    ReusableViewModel: BaseTableViewReusableViewModel,
    ReusableView: BaseTableViewReusableViewWithModel<ReusableViewModel>
>: BaseTableView {
    // MARK: - Dependencies
    private let dataProvider: SimpleSectionTableViewDataProvider<CellModel, Cell, ReusableViewModel, ReusableView>
    
    // MARK: - Data
    public var sections: [SectionModel<ReusableViewModel, CellModel>] {
        get { dataProvider.sections }
        set {
            dataProvider.sections = newValue
            reloadData()
        }
    }
    
    // MARK: - Life cycle
    public override init(frame: CGRect,
                         style: UITableView.Style) {
        dataProvider = SimpleSectionTableViewDataProvider()
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

