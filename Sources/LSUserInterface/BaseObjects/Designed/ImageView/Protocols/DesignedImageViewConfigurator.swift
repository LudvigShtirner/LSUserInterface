//
//  DesignedImageViewConfigurator.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

protocol DesignedImageViewConfigurator: UIImageView {
    var internalImageViewParameters: InternalDesignedImageViewParameters { get set }
    var imageViewParameters: DesignedImageViewParameters { get set }
    
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedImageViewParameters, T>, with value: T) -> Self
}

extension DesignedImageViewConfigurator {
    @discardableResult
    func addParameter<T>(_ parameter: WritableKeyPath<DesignedImageViewParameters, T>, with value: T) -> Self {
        imageViewParameters[keyPath: parameter] = value
        switch parameter {
        case \.image:
            let image = DesignedImageViewImage(image: imageViewParameters.image)
            image.apply(to: self)
        case \.tintColor:
            let tintColor = DesignedImageViewTintColor(tintColor: imageViewParameters.tintColor)
            internalImageViewParameters.tintColor = tintColor
            tintColor.apply(to: self)
        case \.contentMode:
            let contentMode = DesignedImageViewContentMode(contentMode: imageViewParameters.contentMode)
            contentMode.apply(to: self)
        default:
            fatalError("Describe New Type binding")
        }
        return self
    }
}
