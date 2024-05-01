//
//  DesignedButtonInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedButtonInterface: UIButton {
    @discardableResult
    func usingDrawer(_ drawer: DesignedButtonDrawer) -> Self
    
    @discardableResult
    func usingTintColor(_ tintColor: ColorMap) -> Self
    @discardableResult
    func usingTitleColor(_ titleColor: ColorSet) -> Self
    @discardableResult
    func usingBackgroundColors(_ backgroundColors: ColorSet) -> Self
    
    @discardableResult
    func usingImageSet(_ imageSet: ImageSet) -> Self
    @discardableResult
    func usingBackgroundImageSet(_ imageSet: ImageSet) -> Self
    @discardableResult
    func usingTitle(_ titleSet: TitleSet) -> Self
    @discardableResult
    func usingFont(_ font: UIFont) -> Self
    @discardableResult
    func usingNumberOfLines(_ numberOfLines: NumberOfLines) -> Self
    @discardableResult
    func usingContentInsets(_ contentInsets: UIEdgeInsets) -> Self
}

protocol DesignedButtonInterfaceInternal: DesignedButtonInterface {
    var drawer: DesignedButtonDrawer? { get set }
    var lsTintColor: DesignedButtonTintColor? { get set }
    var lsTitleColor: DesignedButtonTitleColor? { get set }
    var lsBackgroundColors: DesignedButtonBackgroundColor? { get set }
}

extension DesignedButtonInterfaceInternal {
    @discardableResult
    public func usingDrawer(_ drawer: DesignedButtonDrawer) -> Self {
        self.drawer = drawer
        return self
    }
    
    @discardableResult
    public func usingTintColor(_ tintColor: ColorMap) -> Self {
        lsTintColor = DesignedButtonTintColor(colorMap: tintColor)
        lsTintColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingTitleColor(_ titleColor: ColorSet) -> Self {
        lsTitleColor = DesignedButtonTitleColor(titleColorSet: titleColor)
        lsTitleColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingBackgroundColors(_ backgroundColors: ColorSet) -> Self {
        lsBackgroundColors = DesignedButtonBackgroundColor(colorSet: backgroundColors)
        lsBackgroundColors?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingImageSet(_ imageSet: ImageSet) -> Self {
        setImage(imageSet.normalImage, for: .normal)
        setImage(imageSet.highlightImage, for: .highlighted)
        setImage(imageSet.disabledImage, for: .disabled)
        return self
    }
    
    @discardableResult
    public func usingBackgroundImageSet(_ imageSet: ImageSet) -> Self {
        setBackgroundImage(imageSet.normalImage, for: .normal)
        setBackgroundImage(imageSet.highlightImage, for: .highlighted)
        setBackgroundImage(imageSet.disabledImage, for: .disabled)
        return self
    }
    
    @discardableResult
    public func usingTitle(_ titleSet: TitleSet) -> Self {
        setTitle(titleSet.normalText, for: .normal)
        setTitle(titleSet.highlightText, for: .highlighted)
        setTitle(titleSet.disabledText, for: .disabled)
        return self
    }
    
    @discardableResult
    public func usingFont(_ font: UIFont) -> Self {
        if titleLabel == nil {
            setTitle("", for: .normal)
        }
        titleLabel?.font = font
        return self
    }
    
    @discardableResult
    public func usingNumberOfLines(_ numberOfLines: NumberOfLines) -> Self {
        titleLabel?.numberOfLines = numberOfLines.value
        return self
    }
    
    @discardableResult
    public func usingContentInsets(_ contentInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentInsets
        return self
    }
}
