//
//  BaseView.swift
//  
//
//  Created by Алексей Филиппов on 27.11.2022.
//

import UIKit

open class BaseView: UIView {
    // MARK: - Life cycle
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupColors()
        setupConstraints()
    }
    
    public required init?(coder: NSCoder) {
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
