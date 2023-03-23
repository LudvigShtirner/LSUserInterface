//
//  BaseCollectionViewReusableViewWithModel.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// SPM
import SnapKit
// Apple
import UIKit

open class BaseCollectionViewReusableViewWithModel<ViewModel: BaseCollectionViewReusableViewModel>: BaseCollectionViewReusableView {
    // MARK: - UI
    private(set) var customView: ViewModel.UIViewType?
    
    // MARK: - Data
    open var model: ViewModel?
    
    // MARK: - Override
    open override func prepareForReuse() {
        customView?.removeFromSuperview()
    }
    
    // MARK: - Interface methods
    open func bind(_ model: ViewModel) {
        customView?.removeFromSuperview()
        let customView = model.makeView()
        addSubview(customView)
        customView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        self.customView = customView
    }
}

public protocol BaseCollectionViewReusableViewModel: Hashable {
    associatedtype UIViewType: UIView
    func makeView() -> UIViewType
}

