//
//  CenteredContainer.swift
//
//
//  Created by Алексей Филиппов on 14.04.2024.
//

// SPM
import SnapKit
// Apple
import UIKit

public final class CenteredContainer: DesignedView {
    private let content: UIView
    private let width: Width
    private let height: Height
    
    public init(content: UIView,
                width: Width = .none,
                height: Height = .none) {
        self.content = content
        self.width = width
        self.height = height
        super.init()
    }
    
    // MARK: - Overrides
    public override func setupUI() {
        addSubview(content)
    }
    
    public override func setupConstraints() {
        content.snp.makeConstraints { make in
            make.center.equalToSuperview()
            switch width {
            case .none: break
            case .fixed(let width): make.width.equalTo(width)
            case .equalSuperview: make.width.equalToSuperview()
            }
            switch height {
            case .none: break
            case .fixed(let height): make.height.equalTo(height)
            case .equalSuperview: make.height.equalToSuperview()
            }
        }
    }
    
    public enum Width {
        case none
        case fixed(CGFloat)
        case equalSuperview
    }
    
    public enum Height {
        case none
        case fixed(CGFloat)
        case equalSuperview
    }
}
