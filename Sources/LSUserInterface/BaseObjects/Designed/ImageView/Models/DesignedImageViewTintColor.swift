//
//  DesignedImageViewTintColor.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// SPM
import SupportCode
// Apple
import UIKit

public struct DesignedImageViewTintColor: DesignedImageViewParameter, DesignedImageViewParameterApplyable {
    // MARK: - Data
    private let tintColor: ColorMap
    
    // MARK: - Life Cycle
    init(tintColor: ColorMap) {
        self.tintColor = tintColor
    }
    
    // MARK: - DesignedImageViewParameter
    public typealias Parameter = ColorMap
    
    // MARK: - DesignedImageViewParameterApplyable
    func apply(to imageView: UIImageView) {
        imageView.tintColor = tintColor.color(for: imageView)
    }
}
