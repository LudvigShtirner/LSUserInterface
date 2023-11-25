//
//  DesignedButtonDrawer.swift
//  
//
//  Created by Алексей Филиппов on 16.11.2023.
//

// Apple
import UIKit

public protocol DesignedButtonDrawer: AnyObject {
    func drawButton(_ button: DesignedButton,
                    rect: CGRect)
}
