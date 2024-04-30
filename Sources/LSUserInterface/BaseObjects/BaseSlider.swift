//
//  BaseSlider.swift
//
//
//  Created by Алексей Филиппов on 07.01.2024.
//

// Apple
import UIKit

open class BaseSlider: UISlider, EventListenerInternal {
    // MARK: - Data
    var listeners: [String: UIControlListener] = [:]
    
    public var currentValue: CGFloat { CGFloat(value) }
    public var minimumCGValue: CGFloat { CGFloat(minimumValue) }
    public var maximumCGValue: CGFloat { CGFloat(maximumValue) }
    public var allValuesWide: CGFloat { maximumCGValue - minimumCGValue }
    public var averageValue: CGFloat { minimumCGValue + allValuesWide.half }
    
    public var leftImageOffset = CGFloat(10)
    public var rightImageOffset = CGFloat(10)
    public var leftOffset: CGFloat {
        guard let image = minimumValueImage else { return .zero }
        return image.size.width + leftImageOffset
    }
    public var rightOffset: CGFloat {
        guard let image = maximumValueImage else { return .zero }
        return image.size.width + rightImageOffset
    }
    public var sliderWidth: CGFloat { bounds.width - leftOffset - rightOffset }
    
    public var thumbCenterX: CGFloat {
        let trackFrame = trackRect(forBounds: bounds)
        let thumbFrame = thumbRect(forBounds: bounds,
                                   trackRect: trackFrame,
                                   value: value)
        return thumbFrame.origin.x + thumbFrame.width.half - trackFrame.origin.x
    }
    
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
    
    @available(*, unavailable)
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
