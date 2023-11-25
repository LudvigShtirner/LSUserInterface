//
//  BaseTableViewCellWithModel.swift
//  
//
//  Created by Алексей Филиппов on 17.02.2023.
//

// SPM
import SnapKit
// Apple
import UIKit

open class BaseTableViewCellWithModel<CellModel: BaseTableViewCellModel>: BaseTableViewCell {
    // MARK: - UI
    private(set) var customView: CellModel.UIViewType?
    
    // MARK: - Data
    open var model: CellModel?
    
    // MARK: - Override
    open override func prepareForReuse() {
        customView?.removeFromSuperview()
        customView = nil
    }
    
    // MARK: - Interface methods
    open func bind(_ model: CellModel) {
        customView?.removeFromSuperview()
        let customView = model.makeView()
        contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        self.customView = customView
    }
}
 
public protocol BaseTableViewCellModel: Hashable {
    associatedtype UIViewType: UIView
    func makeView() -> UIViewType
}
