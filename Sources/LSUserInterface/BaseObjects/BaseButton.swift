//
//  BaseButton.swift
//  
//
//  Created by Алексей Филиппов on 10.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

open class BaseButton: UIButton, EventListenerInternal {
    // MARK: - Data
    var listeners: [String: UIControlListener] = [:]
    
    // MARK: - Inits
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
    
    deinit {
        listeners = [:]
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
