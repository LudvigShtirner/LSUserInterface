//
//  DesignedParameter.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import Foundation

public protocol DesignedParameter {
    associatedtype Parameter
}

protocol DesignedParameterApplyable {
    associatedtype Element
    func apply(to element: Element)
}
