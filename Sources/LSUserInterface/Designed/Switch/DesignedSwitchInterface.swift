//
//  DesignedSwitchInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedSwitchInterface: UISwitch {
    @discardableResult
    func usingIsOn(_ isOn: Bool) -> Self
    
    @discardableResult
    func usingIsOnColor(_ onColor: ColorMap) -> Self
}

protocol DesignedSwitchInterfaceInternal: DesignedSwitchInterface {
    var onColor: DesignedSwitchOnColor? { get set }
}

extension DesignedSwitchInterfaceInternal {
    @discardableResult
    public func usingIsOn(_ isOn: Bool) -> Self {
        self.isOn = isOn
        return self
    }
    
    @discardableResult
    public func usingIsOnColor(_ onColor: ColorMap) -> Self {
        self.onColor = DesignedSwitchOnColor(onColor: onColor)
        self.onColor?.apply(to: self)
        return self
    }
}
