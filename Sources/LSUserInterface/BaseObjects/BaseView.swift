//
//  BaseView.swift
//  
//
//  Created by Алексей Филиппов on 27.11.2022.
//

import UIKit

open class BaseView: UIView {
    // MARK: - Life cycle
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
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
