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

open class DesignedButton: BaseButton, DesignedViewInterfaceInternal {
    // MARK: - DesignedButtonInterfaceInternal
    public var drawer: DesignedButtonDrawer?
    var lsTintColor: DesignedButtonTintColor?
    var lsTitleColor: DesignedButtonTitleColor?
    var lsBackgroundColors: DesignedButtonBackgroundColor?
    
    // MARK: - DesignedViewInterfaceInternal
    public var hitTestDecorator: DesignedViewHitTestDecorator?
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
            guard isHighlighted != oldValue else { return }
            lsTitleColor?.apply(to: self)
            lsBackgroundColors?.apply(to: self)
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            lsTitleColor?.apply(to: self)
            lsBackgroundColors?.apply(to: self)
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
    
    open override func hitTest(_ point: CGPoint,
                               with event: UIEvent?) -> UIView? {
        guard let decorator = hitTestDecorator else {
            return super.hitTest(point, with: event)
        }
        return decorator.hitTest(point, with: event)
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

extension DesignedButton: DesignedButtonInterface {
    public func useTintColor(_ tintColor: ColorMap) {
        lsTintColor = DesignedButtonTintColor(colorMap: tintColor)
        lsTintColor?.apply(to: self)
    }
    
    public func useTitleColor(_ titleColor: ColorSet) {
        lsTitleColor = DesignedButtonTitleColor(titleColorSet: titleColor)
        lsTitleColor?.apply(to: self)
    }
    
    public func useBackgroundColors(_ backgroundColors: ColorSet) {
        lsBackgroundColors = DesignedButtonBackgroundColor(colorSet: backgroundColors)
        lsBackgroundColors?.apply(to: self)
    }
    
    public func useImageSet(_ imageSet: ImageSet) {
        setImage(imageSet.normalImage, for: .normal)
        setImage(imageSet.highlightImage, for: .highlighted)
        setImage(imageSet.disabledImage, for: .disabled)
    }
    
    public func useBackgroundImageSet(_ imageSet: ImageSet) {
        setBackgroundImage(imageSet.normalImage, for: .normal)
        setBackgroundImage(imageSet.highlightImage, for: .highlighted)
        setBackgroundImage(imageSet.disabledImage, for: .disabled)
    }
    
    public func useTitle(normalText: String,
                         highlightText: String? = nil,
                         disabledText: String? = nil) {
        setTitle(normalText, for: .normal)
        setTitle(highlightText, for: .highlighted)
        setTitle(disabledText, for: .disabled)
    }
    
    public func useFont(_ font: UIFont) {
        if titleLabel == nil {
            setTitle("", for: .normal)
        }
        titleLabel?.font = font
    }
    
    public func useNumberOfLines(_ numberOfLines: NumberOfLines) {
        titleLabel?.numberOfLines = numberOfLines.value
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct DesignedButtonPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let button = DesignedButton().apply {
                $0.drawer = DesignedButtonTransparentTextDrawer()
                $0.useTitle(normalText: "Some Text provided to button")
                $0.useCornerRadius(.circled)
                $0.clipsToBounds = true
                $0.useTintColor(.init(color: .random()))
            }
                
            
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
