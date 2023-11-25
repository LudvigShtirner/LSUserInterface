//
//  DesignedSwitchParameters.swift
//  
//
//  Created by Алексей Филиппов on 21.02.2023.
//

// Apple
import Foundation

public struct DesignedSwitchParameters {
    public var isOn: Bool
    public var onColor: DesignedSwitchOnColor.Parameter
}

struct InternalDesignedSwitchParameters {
    var onColor: DesignedSwitchOnColor?
}
