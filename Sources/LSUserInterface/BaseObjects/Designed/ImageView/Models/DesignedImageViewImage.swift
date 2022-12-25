//
//  DesignedImageViewImage.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedImageViewImage: DesignedImageViewParameter, DesignedImageViewParameterApplyable {
    // MARK: - Data
    private let image: UIImage
    
    // MARK: - Life Cycle
    init(image: UIImage) {
        self.image = image
    }
    
    // MARK: - DesignedImageViewParameter
    public typealias Parameter = UIImage
    
    // MARK: - DesignedImageViewParameterApplyable
    func apply(to imageView: UIImageView) {
        imageView.image = image
    }
}
