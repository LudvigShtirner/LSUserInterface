//
//  ImageSet.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct ImageSet {
    // MARK: - Data
    let normalImage: UIImage
    let highlightImage: UIImage?
    let disabledImage: UIImage?
    
    // MARK: - Life cycle
    public init(normalImage: UIImage,
                highlightImage: UIImage? = nil,
                disabledImage: UIImage? = nil) {
        self.normalImage = normalImage
        self.highlightImage = highlightImage
        self.disabledImage = disabledImage
    }
}
