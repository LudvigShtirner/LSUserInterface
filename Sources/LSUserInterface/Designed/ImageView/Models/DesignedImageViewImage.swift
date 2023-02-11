//
//  DesignedImageViewImage.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedImageViewImage: DesignedParameter, DesignedParameterApplyable {
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
        element.image = image
    }
}
