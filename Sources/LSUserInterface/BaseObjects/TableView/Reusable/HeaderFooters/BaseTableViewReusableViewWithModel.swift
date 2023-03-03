//
//  BaseTableViewReusableViewWithModel.swift
//  
//
//  Created by Алексей Филиппов on 28.02.2023.
//

// SPM
import SnapKit
// Apple
import UIKit

open class BaseTableViewReusableViewWithModel<ViewModel: BaseTableViewReusableViewModel>: BaseTableViewReusableView {
    // MARK: - Data
    open var model: ViewModel?
    
    // MARK: - Interface methods
    open func bind(_ model: ViewModel) {
        let customView = model.makeView()
        addSubview(customView)
        customView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}

public protocol BaseTableViewReusableViewModel: Hashable {
    associatedtype UIViewType: UIView
    func makeView() -> UIViewType
}
