//
//  BaseTableViewCell.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {
    // MARK: - Life cycle
    public init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupUI()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Overrides
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Internal methods
    open func setupUI() {
        setupColors()
        setupConstraints()
    }
    
    open func setupColors() {
        
    }
    
    open func setupConstraints() {
        
    }
}
