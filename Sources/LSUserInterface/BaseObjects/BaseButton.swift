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

open class BaseButton: UIButton {
    // MARK: - Data
    private var listeners: [String: UIControlListener<BaseButton>] = [:]
    
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
    open func onEvent(_ action: UIControl.Event,
                      _ closure: @escaping VoidBlock) -> Self {
        let listener: UIControlListener<BaseButton> = .init(control: self,
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
