//
//  DesignedLabelInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedLabelInterface: UILabel {
    func useTextColor(_ textColor: ColorMap)
    func useNumberOfLines(_ numberOfLines: NumberOfLines)
}

protocol DesignedLabelInterfaceInternal: DesignedLabelInterface {
    var lsTextColor: DesignedLabelTextColor? { get set }
}

extension DesignedLabelInterfaceInternal {
    public func useTextColor(_ textColor: ColorMap) {
        lsTextColor = DesignedLabelTextColor(textColor: textColor)
        lsTextColor?.apply(to: self)
    }
    
    public func useNumberOfLines(_ numberOfLines: NumberOfLines) {
        self.numberOfLines = numberOfLines.value
    }
}
