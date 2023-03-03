//
//  DesignedSwitch.swift
//  
//
//  Created by Алексей Филиппов on 21.02.2023.
//

// Apple
import UIKit

open class DesignedSwitch: BaseSwitch, DesignedElementInsertable {
    // MARK: - Data
    private var switchBehaviour = DesignedSwitchBehaviour()
    
    // MARK: - Interface methods
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedSwitchParameters, T>,
                                with value: T) -> Self {
        switchBehaviour.addParameter(parameter,
                                     with: value,
                                     for: self)
        return self
    }
}
