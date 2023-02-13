//
//  DesignedImageViewHighlightedImage.swift
//  
//
//  Created by Алексей Филиппов on 12.02.2023.
//

import UIKit

public struct DesignedImageViewHighlightedImage: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let image: UIImage?
    
    // MARK: - Life Cycle
    init(image: UIImage?) {
        self.image = image
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = UIImage?
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIImageView
    func apply(to element: Element) {
        element.highlightedImage = image
    }
}
