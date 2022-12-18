//
//  BaseViewController.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

import UIKit

open class BaseViewController: UIViewController {
    // MARK: - Life Cycle
    public init() {
        super.init(nibName: nil, bundle: nil)
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
    open func setupUI() {
        setupColors()
        setupConstraints()
    }
    
    open func setupColors() {
        
    }
    
    open func setupConstraints() {
        
    }
}
