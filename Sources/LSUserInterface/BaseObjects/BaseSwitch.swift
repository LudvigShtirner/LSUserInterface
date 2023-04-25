//
//  BaseSwitch.swift
//  
//
//  Created by Алексей Филиппов on 17.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

open class BaseSwitch: UISwitch {
    // MARK: - Data
    private var listeners: [String: UIControlListener<BaseSwitch>] = [:]
    
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
    
    // MARK: - Public methods
    @discardableResult
    open func shouldDo(on action: UIControl.Event,
                       _ closure: @escaping VoidBlock) -> Self {
        let listener: UIControlListener<BaseSwitch> = .init(control: self,
                                                            event: action,
                                                            action: closure)
        listeners[listener.key] = listener
        return self
    }
    
    // MARK: - Internal methods
    open func setupUI() {
        
    }
    
    open func setupColors() {
        
    }
    
    open func setupConstraints() {
        
    }
}
