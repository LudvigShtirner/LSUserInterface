//
//  LinearGradient.swift
//  
//
//  Created by Алексей Филиппов on 03.04.2023.
//

// Apple
import UIKit

open class LinearGradient: BaseView {
    // MARK: - UI
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Data
    private let config: Config
    
    // MARK: - Inits
    public init(config: Config) {
        self.config = config
        super.init(frame: .zero)
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
        gradientLayer.type = .axial
        gradientLayer.colors = [config.startColor.cgColor, config.endColor.cgColor]
        let pivots = config.startFrom.turnIntoPivots()
        gradientLayer.startPoint = pivots.start
        gradientLayer.endPoint = pivots.end
    }
    
    // MARK: - Subtypes
    public struct Config {
        let startColor: UIColor
        let endColor: UIColor
        let startFrom: Direction
    }
    
    public enum Direction {
        case top
        case bottom
        case left
        case right
        case topLeft
        case bottomLeft
        case topRight
        case bottomRight
        case custom(CGPoint, CGPoint)
        
        fileprivate func turnIntoPivots() -> (start: CGPoint, end: CGPoint) {
            switch self {
            case .top:
                return (Self.topPoint, Self.bottomPoint)
            case .bottom:
                return (Self.bottomPoint, Self.topPoint)
            case .left:
                return (Self.leftPoint, Self.rightPoint)
            case .right:
                return (Self.rightPoint, Self.leftPoint)
            case .custom(let start, let end):
                return (start, end)
            case .topLeft:
                return (Self.topLeftPoint, Self.bottomRightPoint)
            case .bottomLeft:
                return (Self.bottomLeftPoint, Self.topRightPoint)
            case .topRight:
                return (Self.topRightPoint, Self.bottomLeftPoint)
            case .bottomRight:
                return (Self.bottomRightPoint, Self.topLeftPoint)
            }
        }
        
        static private var leftPoint: CGPoint { .init(x: .zero, y: 0.5) }
        static private var rightPoint: CGPoint { .init(x: 1.0, y: 0.5) }
        static private var topPoint: CGPoint { .init(x: 0.5, y: .zero) }
        static private var bottomPoint: CGPoint { .init(x: 0.5, y: 1.0) }
        
        static private var topLeftPoint: CGPoint { .zero }
        static private var bottomLeftPoint: CGPoint { .init(x: .zero, y: 1.0) }
        static private var topRightPoint: CGPoint { .init(x: 1.0, y: .zero)}
        static private var bottomRightPoint: CGPoint { .init(x: 1.0, y: 1.0)}
    }
}


// MARK: - SwiftUI Preview
import SwiftUI
import SnapKit

struct LinearGradientContainer_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            LinearGradient(config: .init(startColor: .red,
                                         endColor: .clear,
                                         startFrom: .bottomRight))
        }
        .previewLayout(.fixed(width: 375, height: 375))
        .edgesIgnoringSafeArea(.vertical)
    }
}
