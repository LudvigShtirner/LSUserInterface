//
//  DesignedImageViewBehaviour.swift
//  
//
//  Created by Алексей Филиппов on 11.02.2023.
//

// Apple
import UIKit

struct DesignedImageViewBehaviour {
    // MARK: - Data
    var internalImageViewParameters = InternalDesignedImageViewParameters()
    var imageViewParameters = DesignedImageViewParameters(image: nil,
                                                          highlightedImage: nil,
                                                          tintColor: ColorMap(color: .black),
                                                          contentMode: .scaleToFill)
    
    
    // MARK: - Interface methods
    func traitCollectionDidChange(imageView: UIImageView) {
        internalImageViewParameters.tintColor?.apply(to: imageView)
    }
    
    mutating func addParameter<T>(_ parameter: WritableKeyPath<DesignedImageViewParameters, T>,
                                  with value: T,
                                  for imageView: UIImageView) {
        imageViewParameters[keyPath: parameter] = value
        switch parameter {
        case \.image:
            imageView.image = imageViewParameters.image
        case \.highlightedImage:
            imageView.highlightedImage = imageViewParameters.highlightedImage
        case \.tintColor:
            let tintColor = DesignedImageViewTintColor(tintColor: imageViewParameters.tintColor)
            internalImageViewParameters.tintColor = tintColor
            tintColor.apply(to: imageView)
        case \.contentMode:
            imageView.contentMode = imageViewParameters.contentMode
        default:
            fatalError("Describe New Type binding")
        }
    }
}
