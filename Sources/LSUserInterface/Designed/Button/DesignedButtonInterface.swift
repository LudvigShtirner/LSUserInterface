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
    func setDrawer(_ drawer: DesignedButtonDrawer) -> Self
    
    @discardableResult
    func setTintColor(_ tintColor: ColorMap) -> Self
    @discardableResult
    func setTitleColor(_ titleColor: ColorSet) -> Self
    @discardableResult
    func setBackgroundColors(_ backgroundColors: ColorSet) -> Self
    
    @discardableResult
    func setImageSet(_ imageSet: ImageSet) -> Self
    @discardableResult
    func setBackgroundImageSet(_ imageSet: ImageSet) -> Self
    @discardableResult
    func setTitle(_ titleSet: TitleSet) -> Self
    @discardableResult
    func setFont(_ font: UIFont) -> Self
    @discardableResult
    func setNumberOfLines(_ numberOfLines: NumberOfLines) -> Self
    @discardableResult
    func setContentInsets(_ contentInsets: UIEdgeInsets) -> Self
}

protocol DesignedButtonInterfaceInternal: DesignedButtonInterface {
    var drawer: DesignedButtonDrawer? { get set }
    var lsTintColor: DesignedButtonTintColor? { get set }
    var lsTitleColor: DesignedButtonTitleColor? { get set }
    var lsBackgroundColors: DesignedButtonBackgroundColor? { get set }
}

extension DesignedButtonInterfaceInternal {
    @discardableResult
    public func setDrawer(_ drawer: DesignedButtonDrawer) -> Self {
        self.drawer = drawer
        return self
    }
    
    @discardableResult
    public func setTintColor(_ tintColor: ColorMap) -> Self {
        lsTintColor = DesignedButtonTintColor(colorMap: tintColor)
        lsTintColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setTitleColor(_ titleColor: ColorSet) -> Self {
        lsTitleColor = DesignedButtonTitleColor(titleColorSet: titleColor)
        lsTitleColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setBackgroundColors(_ backgroundColors: ColorSet) -> Self {
        lsBackgroundColors = DesignedButtonBackgroundColor(colorSet: backgroundColors)
        lsBackgroundColors?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setImageSet(_ imageSet: ImageSet) -> Self {
        setImage(imageSet.normalImage, for: .normal)
        setImage(imageSet.highlightImage, for: .highlighted)
        setImage(imageSet.disabledImage, for: .disabled)
        return self
    }
    
    @discardableResult
    public func setBackgroundImageSet(_ imageSet: ImageSet) -> Self {
        setBackgroundImage(imageSet.normalImage, for: .normal)
        setBackgroundImage(imageSet.highlightImage, for: .highlighted)
        setBackgroundImage(imageSet.disabledImage, for: .disabled)
        return self
    }
    
    @discardableResult
    public func setTitle(_ titleSet: TitleSet) -> Self {
        setTitle(titleSet.normalText, for: .normal)
        setTitle(titleSet.highlightText, for: .highlighted)
        setTitle(titleSet.disabledText, for: .disabled)
        return self
    }
    
    @discardableResult
    public func setFont(_ font: UIFont) -> Self {
        if titleLabel == nil {
            setTitle("", for: .normal)
        }
        titleLabel?.font = font
        return self
    }
    
    @discardableResult
    public func setNumberOfLines(_ numberOfLines: NumberOfLines) -> Self {
        titleLabel?.numberOfLines = numberOfLines.value
        return self
    }
    
    @discardableResult
    public func setContentInsets(_ contentInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentInsets
        return self
    }
}
