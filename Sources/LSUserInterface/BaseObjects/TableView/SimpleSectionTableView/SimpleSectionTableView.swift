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
    ReusableView: BaseTableViewReusableViewWithModel<ReusableViewModel>,
    EmptyView: BaseView,
    LoadingView: BaseView
>: BaseTableView<EmptyView, LoadingView> {
    // MARK: - Dependencies
    private let dataProvider: SimpleSectionTableViewDataProvider<CellModel, Cell, ReusableViewModel, ReusableView>
    
    // MARK: - Data
    public var sections: [TableSectionModel<ReusableViewModel, CellModel>] {
        dataProvider.sections
    }
    
    // MARK: - Inits
    public override init(frame: CGRect,
                         style: UITableView.Style,
                         emptyView: EmptyView,
                         loadingView: LoadingView) {
        dataProvider = SimpleSectionTableViewDataProvider()
        super.init(frame: frame,
                   style: style,
                   emptyView: emptyView,
                   loadingView: loadingView)
        configureTableView()
    }
    
    public convenience init(emptyView: EmptyView,
                            loadingView: LoadingView) {
        self.init(frame: .zero,
                  style: .plain,
                  emptyView: emptyView,
                  loadingView: loadingView)
    }
    
    // MARK: - Interface methods
    func updateSections(_ sections: [TableSectionModel<ReusableViewModel, CellModel>]) {
        dataProvider.sections = sections
        reloadData()
        let isEmpty = sections
            .filter { $0.isEmpty == false }
            .isEmpty
        update(isLoading: false,
               isEmpty: isEmpty)
    }
    
    // MARK: - Private methods
    private func configureTableView() {
        dataSource = dataProvider
        delegate = dataProvider
        registerCell(Cell.self)
    }
}

