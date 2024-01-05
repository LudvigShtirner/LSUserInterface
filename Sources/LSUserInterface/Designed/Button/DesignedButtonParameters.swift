//
//  DesignedButtonParameters.swift
//  
//
//  Created by Алексей Филиппов on 12.12.2022.
//

// Apple
import UIKit

public struct DesignedButtonParameters {
    public var tintColor: DesignedButtonTintColor.Parameter
    public var titleColor: DesignedButtonTitleColor.Parameter
    public var imageSet: ImageSet
    public var backgroundImageSet: ImageSet
    public var titleSet: TitleSet
    public var font: UIFont
    public var numberOfLines: NumberOfLines
    
    static func makeDefault() -> DesignedButtonParameters {
        DesignedButtonParameters(tintColor: ColorMap(color: .clear),
                                 titleColor: ColorSet(normal: ColorMap(color: .black)),
                                 imageSet: ImageSet(),
                                 backgroundImageSet: ImageSet(),
                                 titleSet: TitleSet(normalText: ""),
                                 font: .systemFont(ofSize: 14.0),
                                 numberOfLines: .restricted(1))
    }
}

struct InternalDesignedButtonParameters {
    var tintColor: DesignedButtonTintColor?
    var titleColor: DesignedButtonTitleColor?
}
