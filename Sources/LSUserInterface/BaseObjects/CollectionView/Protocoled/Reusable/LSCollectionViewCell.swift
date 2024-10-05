//
//  LSCollectionViewCell.swift
//
//
//  Created by Алексей Филиппов on 17.08.2024.
//

// SPM
import SnapKit
// Apple
import UIKit

open class LSCollectionViewCell<ViewMaker: ViewProvider>: BaseCollectionViewCell {
    // MARK: - UI
    public let customView = ViewMaker.makeView()
    
    // MARK: - Overrides
    open override func prepareForReuse() {
        super.prepareForReuse()
        customView.prepareForReuse()
    }
    
    open override func setupUI() {
        super.setupUI()
        contentView.addSubview(customView)
    }
    
    open override func setupConstraints() {
        super.setupConstraints()
        customView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}

public protocol ViewProvider {
    associatedtype UIViewType: BaseCollectionViewContentView
    static func makeView() -> UIViewType
}

public protocol BaseCollectionViewContentView: UIView {
    func prepareForReuse()
}

public extension BaseCollectionViewContentView {
    func prepareForReuse() { }
}
