//
//  BaseTableViewReusableView.swift
//  
//
//  Created by Алексей Филиппов on 28.02.2023.
//

// Apple
import UIKit

open class BaseTableViewReusableView: UITableViewHeaderFooterView {
    // MARK: - Inits
    public convenience init() {
        self.init(reuseIdentifier: nil)
    }
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
        setupColors()
        setupConstraints()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupColors()
        setupConstraints()
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
