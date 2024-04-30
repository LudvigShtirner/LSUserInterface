//
//  BaseCollectionViewCellWithModel.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// SPM
import SnapKit
// Apple
import UIKit

open class BaseCollectionViewCellWithModel<CellModel: BaseCollectionViewCellModel>: BaseCollectionViewCell {
    // MARK: - UI
    public private(set) var customView: CellModel.UIViewType?
    
    // MARK: - Data
    open var model: CellModel?
    
    // MARK: - Override
    open override func prepareForReuse() {
        super.prepareForReuse()
        customView?.removeFromSuperview()
    }
    
    // MARK: - Interface methods
    open func bind(_ model: CellModel) {
        customView?.removeFromSuperview()
        let view = model.makeView()
        self.customView = view
        insert(customView: view)
    }
    
    // MARK: - Private methods
    private func insert(customView: CellModel.UIViewType) {
        contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        setupColors()
    }
}

public protocol BaseCollectionViewCellModel: Hashable {
    associatedtype UIViewType: UIView
    func makeView() -> UIViewType
}
