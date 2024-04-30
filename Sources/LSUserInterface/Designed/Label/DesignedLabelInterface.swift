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
    func setTextColor(_ textColor: ColorMap) -> Self
    @discardableResult
    func setText(_ text: String) -> Self
    @discardableResult
    func setFont(_ font: UIFont) -> Self
    @discardableResult
    func setNumberOfLines(_ numberOfLines: NumberOfLines) -> Self
    @discardableResult
    func setTextAlignment(_ textAlignment: NSTextAlignment) -> Self
}

protocol DesignedLabelInterfaceInternal: DesignedLabelInterface {
    var lsTextColor: DesignedLabelTextColor? { get set }
}

extension DesignedLabelInterfaceInternal {
    @discardableResult
    public func setTextColor(_ textColor: ColorMap) -> Self {
        lsTextColor = DesignedLabelTextColor(textColor: textColor)
        lsTextColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setText(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func setFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func setNumberOfLines(_ numberOfLines: NumberOfLines) -> Self {
        self.numberOfLines = numberOfLines.value
        return self
    }
    
    @discardableResult
    public func setTextAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
}
