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
    // MARK: - Data
    open var model: CellModel?
    
    // MARK: - Interface methods
    open func bind(_ model: CellModel) {
        let customView = model.makeView()
        contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}
 
public protocol BaseTableViewCellModel: Hashable {
    associatedtype UIViewType: UIView
    func makeView() -> UIViewType
}
