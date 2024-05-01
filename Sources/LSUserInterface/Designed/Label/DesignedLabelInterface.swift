//
//  DesignedLabelInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedLabelInterface: UILabel {
    @discardableResult
    func usingTextColor(_ textColor: ColorMap) -> Self
    @discardableResult
    func usingText(_ text: String) -> Self
    @discardableResult
    func usingFont(_ font: UIFont) -> Self
    @discardableResult
    func usingNumberOfLines(_ numberOfLines: NumberOfLines) -> Self
    @discardableResult
    func usingTextAlignment(_ textAlignment: NSTextAlignment) -> Self
}

protocol DesignedLabelInterfaceInternal: DesignedLabelInterface {
    var lsTextColor: DesignedLabelTextColor? { get set }
}

extension DesignedLabelInterfaceInternal {
    @discardableResult
    public func usingTextColor(_ textColor: ColorMap) -> Self {
        lsTextColor = DesignedLabelTextColor(textColor: textColor)
        lsTextColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingText(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func usingFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func usingNumberOfLines(_ numberOfLines: NumberOfLines) -> Self {
        self.numberOfLines = numberOfLines.value
        return self
    }
    
    @discardableResult
    public func usingTextAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
}
