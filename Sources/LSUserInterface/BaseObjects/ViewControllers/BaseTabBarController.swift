//
//  BaseTabBarController.swift
//  
//
//  Created by Алексей Филиппов on 21.03.2023.
//

// Apple
import UIKit

open class BaseTabBarController: UITabBarController {
    // MARK: - Overrides
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupColors()
        setupConstraints()
    }
    
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
