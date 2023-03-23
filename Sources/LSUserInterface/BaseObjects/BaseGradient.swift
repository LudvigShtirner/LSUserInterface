//
//  BaseGradient.swift
//  
//
//  Created by Алексей Филиппов on 15.03.2023.
//

// Apple
import UIKit

open class BaseGradient: BaseView {
    // MARK: - UI
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Life cycle
    init(config: BaseGradientConfig) {
        super.init(frame: .zero)
        gradientLayer.type = config.type
        gradientLayer.colors = config.pivots.map { $0.color }
        gradientLayer.locations = config.pivots.map { $0.location as NSNumber }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    open override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - BaseView
    open override func setupUI() {
        layer.addSublayer(gradientLayer)
    }
}

public struct BaseGradientConfig {
    // MARK: - Data
    let type: CAGradientLayerType
    let pivots: [BaseGradientPivot]
    
    // MARK: - Life cycle
    public init(type: CAGradientLayerType,
                pivots: [BaseGradientPivot]) throws {
        guard pivots.count >= 2 else {
            assertionFailure("Use more pivots to construct gradient")
            throw NSError(domain: "LSUserInterface.BaseGradient", code: -1111)
        }
        self.type = type
        self.pivots = pivots
    }
}

public struct BaseGradientPivot {
    // MARK: - Data
    let location: CGFloat
    let color: UIColor
    
    // MARK: - Life cycle
    public init(location: CGFloat,
                color: UIColor) {
        self.location = location
        self.color = color
    }
}
