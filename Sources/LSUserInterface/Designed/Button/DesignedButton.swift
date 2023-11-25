//
//  DesignedButton.swift
//  
//
//  Created by Алексей Филиппов on 11.12.2022.
//

// Apple
import UIKit
// Pods
import SnapKit

open class DesignedButton: BaseButton, DesignedViewInterfaceInternal, DesignedElementInsertable {
    // MARK: - Data
    private var buttonBehaviour = DesignedButtonBehaviour()
    private let buttonDrawer: DesignedButtonDrawer?
    var viewBehaviour = DesignedViewBehaviour()
    
    // MARK: - Inits
    public init(frame: CGRect = .zero,
                buttonDrawer: DesignedButtonDrawer? = nil) {
        self.buttonDrawer = buttonDrawer
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    open override var isHighlighted: Bool {
        didSet {
            buttonBehaviour.isHighlightedChanged(button: self)
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            buttonBehaviour.isEnabledChanged(button: self)
        }
    }
    
    public override var tintColor: UIColor! {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        guard let buttonDrawer else {
            super.draw(rect)
            return
        }
        buttonDrawer.drawButton(self, rect: rect)
    }
    
    public override func setTitle(_ title: String?,
                                  for state: UIControl.State) {
        super.setTitle(title, for: state)
        setNeedsDisplay()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBehaviour.layoutSubviews(view: self)
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        viewBehaviour.traitCollectionDidChange(view: self)
        buttonBehaviour.traitCollectionDidChange(button: self)
    }
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedButtonParameters, T>,
                                with value: T) -> Self {
        buttonBehaviour.addParameter(parameter,
                                     with: value,
                                     for: self)
        return self
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct DesignedButtonPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let view = BaseView()
            view.backgroundColor = .white
            
            let button = DesignedButton(buttonDrawer: DesignedButtonTransparentTextDrawer())
                .insert(into: view)
                .setParameter(\.titleSet, with: .init(normalText: "Some Text provided to button"))
                .setParameter(\.cornerRadius, with: .circled)
                .setParameter(\.clipsToBounds, with: true)
                .setParameter(\.tintColor, with: .init(color: .random()))
            
            button.onEvents([.touchUpInside, .touchCancel, .touchUpOutside, .touchDragExit]) { [weak button] in
                button?.animation
                    .transform(transform: .identity)
                    .execute()
            }
            .onEvents([.touchDown, .touchDragEnter]) { [weak button] in
                let scale = 1.05
                button?.animation
                    .transform(transform: .init(scaleX: scale, y: scale))
                    .execute()
            }
            
            button.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.equalTo(260)
                make.height.equalTo(64)
            }
            
            return view
        }
        .previewLayout(.fixed(width: 375, height: 120))
        .edgesIgnoringSafeArea(.vertical)
    }
}
