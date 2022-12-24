//
//  NumberOfLines.swift
//  
//
//  Created by Алексей Филиппов on 18.12.2022.
//

// Apple
import Foundation

/// Количество строк
public enum NumberOfLines {
    case restricted(Int)
    case multiline
    
    var value: Int {
        switch self {
        case .restricted(let lines):
            return lines
        case .multiline:
            return 0
        }
    }
}
