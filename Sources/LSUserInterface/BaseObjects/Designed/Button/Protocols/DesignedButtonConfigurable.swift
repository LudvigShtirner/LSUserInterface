//
//  DesignedButtonConfigurable.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

import UIKit

protocol DesignedButtonConfigurable: UIButton {
    var internalButtonParameters: InternalDesignedButtonParameters { get set }
    var buttonParameters: DesignedButtonParameters { get set }
}
