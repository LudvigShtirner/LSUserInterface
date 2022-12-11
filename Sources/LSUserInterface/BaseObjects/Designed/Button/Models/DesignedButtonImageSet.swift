//
//  DesignedButtonImageSet.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

struct DesignedButtonImageSet: DesignedButtonParameter {
    // MARK: - Data
    var normalImage: UIImage
    var highlightImage: UIImage?
    var disabledImage: UIImage?
    
    // MARK: - Life cycle
    init(normalImage: UIImage,
         highlightImage: UIImage? = nil,
         disabledImage: UIImage? = nil) {
        self.normalImage = normalImage
        self.highlightImage = highlightImage
        self.disabledImage = disabledImage
    }
    
    // MARK: - DesignedButtonParameter
    typealias Parameter = DesignedButtonImageSet
    func apply(to button: UIButton) {
        button.setImage(normalImage, for: .normal)
        button.setImage(highlightImage, for: .highlighted)
        button.setImage(disabledImage, for: .disabled)
    }
}
