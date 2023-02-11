//
//  DesignedButtonImageSet.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

public struct DesignedButtonImageSet: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let imageSet: ImageSet
    
    // MARK: - Life cycle
    init(imageSet: ImageSet) {
        self.imageSet = imageSet
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ImageSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UIButton
    func apply(to element: Element) {
        element.setImage(imageSet.normalImage, for: .normal)
        element.setImage(imageSet.highlightImage, for: .highlighted)
        element.setImage(imageSet.disabledImage, for: .disabled)
    }
}
