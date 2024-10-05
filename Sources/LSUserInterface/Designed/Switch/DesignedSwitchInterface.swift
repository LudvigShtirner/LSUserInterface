//
//  DesignedSwitchInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedSwitchInterface: UISwitch {
    func useIsOnColor(_ onColor: ColorMap)
}

protocol DesignedSwitchInterfaceInternal: DesignedSwitchInterface {
    var onColor: DesignedSwitchOnColor? { get set }
}

extension DesignedSwitchInterfaceInternal {
    public func useIsOnColor(_ onColor: ColorMap) {
        self.onColor = DesignedSwitchOnColor(onColor: onColor)
        self.onColor?.apply(to: self)
    }
}
