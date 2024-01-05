//
//  BaseTableView.swift
//  
//
//  Created by Алексей Филиппов on 17.02.2023.
//

// SPM
import SnapKit
// Apple
import UIKit

open class BaseTableView<
    EmptyView: BaseView,
    LoadingView: BaseView
>: UITableView {
    // MARK: - UI
    public let emptyView: EmptyView
    public let loadingView: LoadingView
    
    // MARK: - Data
    private var isLoading = false
    
    // MARK: - Inits
    public init(frame: CGRect,
                style: UITableView.Style,
                emptyView: EmptyView,
                loadingView: LoadingView) {
        self.emptyView = emptyView
        self.loadingView = loadingView
        super.init(frame: frame, style: style)
        setupUI()
        setupColors()
        setupConstraints()
        changeVisibility(isEmpty: true)
    }
    
    convenience public init(emptyView: EmptyView,
                            loadingView: LoadingView) {
        self.init(frame: .zero,
                  style: .plain,
                  emptyView: emptyView,
                  loadingView: loadingView)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Interface methods
    func update(isLoading: Bool,
                isEmpty: Bool) {
        self.isLoading = isLoading
        changeVisibility(isEmpty: isEmpty)
    }
    
    // MARK: - Internal methods
    open func setupUI() {
        addSubview(emptyView)
        addSubview(loadingView)
    }
    
    open func setupColors() {
        
    }
    
    open func setupConstraints() {
        emptyView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        loadingView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    // MARK: - Private methods
    private func changeVisibility(isEmpty: Bool) {
        loadingView.isHidden = !isLoading
        emptyView.isHidden = !isEmpty
    }
}
