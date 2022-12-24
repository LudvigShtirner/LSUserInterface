//
//  DesignedButtonImageSet.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

public struct DesignedButtonImageSet: DesignedButtonParameter, DesignedButtonParameterApplyable {
    // MARK: - Data
    private let imageSet: ImageSet
    
    // MARK: - Life cycle
    init(imageSet: ImageSet) {
        self.imageSet = imageSet
    }
    
    // MARK: - DesignedButtonParameter
    public typealias Parameter = ImageSet
    
    // MARK: - DesignedButtonParameterApplyable
    public func apply(to button: UIButton) {
        button.setImage(imageSet.normalImage, for: .normal)
        button.setImage(imageSet.highlightImage, for: .highlighted)
        button.setImage(imageSet.disabledImage, for: .disabled)
    }
}
