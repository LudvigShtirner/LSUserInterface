//
//  NibReusable.swift
//  
//
//  Created by Алексей Филиппов on 09.07.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

public protocol NibReusable: UIView, ClassIdentifiable {
    static var nibName: String { get }
}

public extension NibReusable {
    static var nibName: String {
        classIdentifier
    }
}
