//
//  DesignedElementInsertable.swift
//  
//
//  Created by Алексей Филиппов on 25.02.2023.
//

// Apple
import UIKit

public protocol DesignedElementInsertable: UIView {
    @discardableResult
    func insert(into view: UIView) -> Self
}

public extension DesignedElementInsertable {
    @discardableResult
    func insert(into view: UIView) -> Self {
        view.addSubview(self)
        return self
    }
}
