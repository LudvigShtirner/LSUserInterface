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

open class DesignedButton: BaseButton, DesignedViewInterfaceInternal, DesignedButtonInterfaceInternal {
    // MARK: - DesignedButtonInterfaceInternal
    var drawer: DesignedButtonDrawer?
    var lsTintColor: DesignedButtonTintColor?
    var lsTitleColor: DesignedButtonTitleColor?
    var lsBackgroundColors: DesignedButtonBackgroundColor?
    
    // MARK: - DesignedViewInterfaceInternal
    var hitTestDecorator: DesignedViewHitTestDecorator?
    var lsCornerRadius: DesignedViewCornerRadius?
    var lsBackgroundColor: DesignedViewBackgroundColor?
    var lsBorder: DesignedViewBorder?
    var lsShadow: DesignedViewShadow?
    
    // MARK: - Inits
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    // MARK: - Overrides
    open override var isHighlighted: Bool {
        didSet {
            lsTitleColor?.apply(to: self)
            lsBackgroundColor?.apply(to: self)
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            lsTitleColor?.apply(to: self)
            lsBackgroundColor?.apply(to: self)
        }
    }
    
    public override var tintColor: UIColor! {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        guard let drawer else {
            super.draw(rect)
            return
        }
        drawer.drawButton(self, rect: rect)
    }
    
    public override func setTitle(_ title: String?,
                                  for state: UIControl.State) {
        super.setTitle(title, for: state)
        setNeedsDisplay()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        lsCornerRadius?.apply(to: self)
        lsShadow?.apply(to: self)
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        lsBackgroundColor?.apply(to: self)
        lsBorder?.apply(to: self)
        lsShadow?.apply(to: self)
        lsTintColor?.apply(to: self)
        lsTitleColor?.apply(to: self)
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct DesignedButtonPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let button = DesignedButton()
                .usingDrawer(DesignedButtonTransparentTextDrawer())
                .usingTitle(.init(normalText: "Some Text provided to button"))
                .usingCornerRadius(.circled)
                .usingClipsToBounds(true)
                .usingTintColor(.init(color: .random()))
            
            button.onEvents([.touchUpInside, .touchCancel, .touchUpOutside, .touchDragExit]) { [weak button] in
                button?.ls.animation
                    .transform(transform: .identity)
                    .execute()
            }
            .onEvents([.touchDown, .touchDragEnter]) { [weak button] in
                let scale = 1.05
                button?.ls.animation
                    .transform(transform: CGAffineTransform(scaleX: scale, y: scale))
                    .execute()
            }
            
            return CenteredContainer(content: button,
                                     width: .fixed(260),
                                     height: .fixed(64))
        }
        .previewLayout(.fixed(width: 375, height: 120))
        .edgesIgnoringSafeArea(.vertical)
    }
}
