//
//  DesignedViewConfigurable.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

protocol DesignedViewConfigurable: UIView {
    var internalViewParameters: InternalBaseDesignedViewParameters { get set }
    var viewParameters: DesignedViewParameters { get set }
}
