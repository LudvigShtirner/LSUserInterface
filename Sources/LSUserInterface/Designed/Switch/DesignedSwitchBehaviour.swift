//
//  DesignedSwitchBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 21.02.2023.
//

// Apple
import UIKit

struct DesignedSwitchBehaviour {
    // MARK: - Data
    var internalSwitchParameters = InternalDesignedSwitchParameters()
    var switchParameters = DesignedSwitchParameters(isOn: true)
    
    // MARK: - Interface methods
    mutating func addParameter<T>(_ parameter: WritableKeyPath<DesignedSwitchParameters, T>,
                                  with value: T,
                                  for toggle: UISwitch) {
        switchParameters[keyPath: parameter] = value
        switch parameter {
        case \.isOn:
            toggle.isOn = switchParameters.isOn
        default:
            fatalError("Describe New Type binding")
        }
    }
}
