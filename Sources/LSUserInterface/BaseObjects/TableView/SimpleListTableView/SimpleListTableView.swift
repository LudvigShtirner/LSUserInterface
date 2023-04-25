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
    Cell: BaseTableViewCellWithModel<CellModel>,
    EmptyView: BaseView,
    LoadingView: BaseView
>: BaseTableView<EmptyView, LoadingView> {
    // MARK: - Dependencies
    private let dataProvider: SimpleListTableViewDataProvider<CellModel, Cell>
    
    // MARK: - Data
    public var models: [CellModel] {
        dataProvider.models
    }
    
    // MARK: - Inits
    public override init(frame: CGRect,
                         style: UITableView.Style,
                         emptyView: EmptyView,
                         loadingView: LoadingView) {
        dataProvider = SimpleListTableViewDataProvider()
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
    
    // MARK: - Private methods
    private func configureTableView() {
        dataSource = dataProvider
        delegate = dataProvider
        registerCell(Cell.self)
    }
}
