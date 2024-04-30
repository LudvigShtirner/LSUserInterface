//
//  BaseCollectionView.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// SPM
import SnapKit
// Apple
import UIKit

open class BaseCollectionView<
    EmptyView: BaseView,
    LoadingView: BaseView
>: UICollectionView {
    // MARK: - UI
    public let emptyView: EmptyView
    public let loadingView: LoadingView
    
    // MARK: - Data
    private var isLoading = false
    
    // MARK: - Life cycle
    public init(frame: CGRect,
                collectionViewLayout layout: UICollectionViewLayout,
                emptyView: EmptyView,
                loadingView: LoadingView) {
        self.emptyView = emptyView
        self.loadingView = loadingView
        super.init(frame: frame, collectionViewLayout: layout)
        setupUI()
        setupColors()
        setupConstraints()
        changeVisibility(isEmpty: true)
    }
    
    convenience public init(collectionViewLayout layout: UICollectionViewLayout,
                            emptyView: EmptyView,
                            loadingView: LoadingView) {
        self.init(frame: .zero,
                  collectionViewLayout: layout,
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
    
    #warning("Horizontal only")
    func scrollToEnd(animated: Bool) {
        let maxOffset = contentSize.width - bounds.width + contentInset.right
        let scrollToEndPoint = CGPoint(x: max(-contentInset.left, maxOffset),
                                       y: .zero)
        setContentOffset(scrollToEndPoint,
                         animated: animated)
    }
    
    // MARK: - Internal methods
    open func setupUI() {
        addSubview(emptyView)
        addSubview(loadingView)
        
        contentInset = .zero
        contentInsetAdjustmentBehavior = .never
    }
    
    open func setupColors() {}
    
    open func setupConstraints() {
        emptyView.snp.makeConstraints { make in
            make.directionalEdges.equalTo(frameLayoutGuide.snp.directionalEdges)
        }
        loadingView.snp.makeConstraints { make in
            make.directionalEdges.equalTo(frameLayoutGuide.snp.directionalEdges)
        }
    }
    
    // MARK: - Private methods
    private func changeVisibility(isEmpty: Bool) {
        loadingView.isHidden = !isLoading
        emptyView.isHidden = !isEmpty
    }
}
