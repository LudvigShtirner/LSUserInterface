//
//  BaseTableView.swift
//  
//
//  Created by Алексей Филиппов on 17.02.2023.
//

// Apple
import UIKit

open class BaseTableView: UITableView {
    // MARK: - Life cycle
    public override init(frame: CGRect,
                         style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupUI()
        setupColors()
        setupConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Internal methods
    open func setupUI() {
        
    }
    
    open func setupColors() {
        
    }
    
    open func setupConstraints() {
        
    }
}
