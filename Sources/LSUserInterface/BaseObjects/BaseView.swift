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
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Internal methods
    public func setupUI() {
        setupColors()
        setupConstraints()
    }
    
    public func setupColors() {
        
    }
    
    public func setupConstraints() {
        
    }
}
