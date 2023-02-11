//
//  BaseViewController.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

import UIKit

open class BaseViewController: UIViewController {
    // MARK: - Overrides
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
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
