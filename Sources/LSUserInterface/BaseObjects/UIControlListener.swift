//
//  UIControlListener.swift
//  
//
//  Created by Алексей Филиппов on 17.02.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

final class UIControlListener<T: UIControl> {
    // MARK: - Data
    private let event: UIControl.Event
    private let action: VoidBlock
    let key: String
    
    // MARK: - Life cycle
    init(control: T,
         event: UIControl.Event,
         action: @escaping VoidBlock) {
        self.event = event
        self.action = action
        self.key = String(describing: event)
        
        control.addTarget(self, action: #selector(handle), for: event)
    }
    
    @objc private func handle() {
        action()
    }
}
