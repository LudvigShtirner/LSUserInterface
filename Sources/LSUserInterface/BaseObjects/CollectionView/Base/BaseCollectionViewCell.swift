//
//  BaseCollectionViewCell.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// Apple
import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {
    // MARK: - Inits
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupColors()
        setupConstraints()
    }
    
    @available(*, unavailable)
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
