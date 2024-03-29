//
//  Style.swift
//
//
//  Created by Алексей Филиппов on 20.02.2023.
//

// Apple
import Foundation

public struct Style<T> {
    // MARK: - Data
    private let styling: (T) -> Void
    
    // MARK: - Inits
    public init(styling: @escaping (T) -> Void) {
        self.styling = styling
    }
    
    // MARK: - Interface methods
    public func apply(to view: T) {
        styling(view)
    }
    
    public func apply(to views: T...) {
        for view in views {
            apply(to: view)
        }
    }
    
    public func compose(with other: Style<T>) -> Self {
        return Style { view in
            self.apply(to: view)
            other.apply(to: view)
        }
    }
    
    public static func compose(_ styles: Style<T>...) -> Self {
        return Style { view in
            for style in styles {
                style.apply(to: view)
            }
        }
    }
}
