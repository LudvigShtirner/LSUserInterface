//
//  DesignedImageViewParameters.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedImageViewParameters {
    public var image: UIImage?
    public var highlightedImage: UIImage?
    public var tintColor: DesignedImageViewTintColor.Parameter
    public var contentMode: UIView.ContentMode
}

struct InternalDesignedImageViewParameters {
    var tintColor: DesignedImageViewTintColor?
}
