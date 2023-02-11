//
//  DesignedImageViewParameters.swift
//  
//
//  Created by Алексей Филиппов on 24.12.2022.
//

// Apple
import UIKit

public struct DesignedImageViewParameters {
    public var image: DesignedImageViewImage.Parameter
    public var tintColor: DesignedImageViewTintColor.Parameter
    public var contentMode: DesignedImageViewContentMode.Parameter
}

struct InternalDesignedImageViewParameters {
    var tintColor: DesignedImageViewTintColor?
}
