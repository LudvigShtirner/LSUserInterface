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
        views.forEach { apply(to: $0) }
    }
    
    public func compose(with other: Style<T>) -> Self {
        Style {
            self.apply(to: $0)
            other.apply(to: $0)
        }
    }
    
    public static func compose(_ styles: Style<T>...) -> Self {
        Style { view in
            styles.forEach { $0.apply(to: view) }
        }
    }
}
