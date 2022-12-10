//
//  BaseButton.swift
//  
//
//  Created by Алексей Филиппов on 10.12.2022.
//

// Own
import SupportCode
// Apple
import UIKit

open class BaseButton: UIButton {
    // MARK: - Data
    private var actions: [String: VoidBlock] = [:]
    
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
    
    deinit {
        actions = [:]
    }
    
    // MARK: - Overrides
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Public methods
    public func shouldDo(on action: UIControl.Event,
                         _ closure: @escaping VoidBlock) {
        let key = String(describing: action)
        actions[key] = closure
    }
    
    // MARK: - Internal methods
    open func setupUI() {
        addTarget(self,
                  action: #selector(handle(sender:forEvent:)),
                  for: .allTouchEvents)
        
        setupColors()
        setupConstraints()
    }
    
    open func setupColors() {
        
    }
    
    open func setupConstraints() {
        
    }
    
    // MARK: - Actions
    @objc private func handle(sender: Any,
                              forEvent event: UIControl.Event) {
        let key = String(describing: event)
        actions[key]?()
    }
}
