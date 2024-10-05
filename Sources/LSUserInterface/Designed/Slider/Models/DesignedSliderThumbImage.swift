//
//  DesignedSliderThumbImage.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

struct DesignedSliderThumbImage: DesignedParameter, DesignedParameterApplyable {
    // MARK: - Data
    private let thumbImage: Parameter
    
    // MARK: - Inits
    init(thumbImage: Parameter) {
        self.thumbImage = thumbImage
    }
    
    // MARK: - DesignedParameter
    public typealias Parameter = ImageSet
    
    // MARK: - DesignedParameterApplyable
    typealias Element = UISlider
    func apply(to element: Element) {
        element.setThumbImage(thumbImage.normalImage, for: .normal)
        element.setThumbImage(thumbImage.highlightImage ?? thumbImage.normalImage, for: .highlighted)
        element.setThumbImage(thumbImage.disabledImage ?? thumbImage.normalImage, for: .disabled)
    }
}
