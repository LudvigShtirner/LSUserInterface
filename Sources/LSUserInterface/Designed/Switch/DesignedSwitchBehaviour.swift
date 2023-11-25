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
    private var switchParameters = DesignedSwitchParameters(isOn: true,
                                                            onColor: .init(color: .blue))
    
    // MARK: - Interface methods
    func layoutSubviews(view: UISwitch) {
        internalSwitchParameters.onColor?.apply(to: view)
    }
    
    mutating func addParameter<T>(_ parameter: WritableKeyPath<DesignedSwitchParameters, T>,
                                  with value: T,
                                  for toggle: UISwitch) {
        switchParameters[keyPath: parameter] = value
        switch parameter {
        case \.isOn:
            toggle.isOn = switchParameters.isOn
        case \.onColor:
            let onColor = DesignedSwitchOnColor(onColor: switchParameters.onColor)
            internalSwitchParameters.onColor = onColor
            onColor.apply(to: toggle)
        default:
            fatalError("Describe New Type binding")
        }
    }
}
