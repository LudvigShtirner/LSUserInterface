//
//  DesignedImageViewContentMode.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedImageViewContentMode: DesignedImageViewParameter, DesignedImageViewParameterApplyable {
    // MARK: - Data
    private let contentMode: Parameter
    
    // MARK: - Life cycle
    init(contentMode: Parameter) {
        self.contentMode = contentMode
    }
    
    // MARK: - DesignedImageViewParameter
    public typealias Parameter = UIView.ContentMode
    
    // MARK: - DesignedImageViewParameterApplyable
    func apply(to imageView: UIImageView) {
        imageView.contentMode = contentMode
    }
}
