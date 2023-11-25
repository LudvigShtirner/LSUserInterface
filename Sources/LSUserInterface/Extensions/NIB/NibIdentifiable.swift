//
//  NibIdentifiable.swift
//  
//
//  Created by Алексей Филиппов on 09.07.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

extension UIView: ClassIdentifiable {
    
}

extension UIViewController: ClassIdentifiable {
    
}

public extension UIView {
    static var nib: UINib {
        UINib(nibName: classIdentifier, bundle: nil)
    }
    
    static func instantiateFromNib() -> Self {
        let instances = nib.instantiate(withOwner: nil, options: nil)
        guard let view = instances.first as? Self else {
            fatalError("Couldn't find nib file for \(classIdentifier)")
        }
        return view
    }
}

public extension UIViewController {
    static func instantiateFromNib() -> Self {
        Self(nibName: classIdentifier, bundle: Bundle(for: Self.self))
    }
}
