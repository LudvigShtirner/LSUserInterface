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
    private var listeners: [String: ButtonListener] = [:]
    
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
    
    deinit {
        listeners = [:]
    }
    
    // MARK: - Overrides
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Public methods
    @discardableResult
    public func shouldDo(on action: UIControl.Event,
                         _ closure: @escaping VoidBlock) -> Self {
        let listener = ButtonListener(button: self,
                                      event: action,
                                      action: closure)
        listeners[listener.key] = listener
        return self
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

fileprivate final class ButtonListener {
    // MARK: - Data
    private let event: UIControl.Event
    private let action: VoidBlock
    var key: String { String(describing: event) }
    
    // MARK: - Life cycle
    init(button: UIButton,
         event: UIControl.Event,
         action: @escaping VoidBlock) {
        self.event = event
        self.action = action
        
        button.addTarget(self, action: #selector(handle), for: event)
    }
    
    @objc private func handle() {
        action()
    }
}
