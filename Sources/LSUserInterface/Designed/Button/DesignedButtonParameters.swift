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
    public var titleSet: TitleSet
    public var font: UIFont
    public var numberOfLines: NumberOfLines
    public var cornerRadius: DesignedButtonCornerRadius.Parameter
    public var backgroundColor: DesignedButtonBackgroundColor.Parameter
    public var border: DesignedButtonBorder.Parameter
    
    static func makeDefault() -> DesignedButtonParameters {
        DesignedButtonParameters(tintColor: .init(color: .clear),
                                 titleColor: .init(normal: .init(color: .black)),
                                 imageSet: .init(),
                                 titleSet: .init(normalText: ""),
                                 font: .systemFont(ofSize: 14.0),
                                 numberOfLines: .restricted(1),
                                 cornerRadius: .fixed(.zero),
                                 backgroundColor: .init(normal: .init(color: .white)),
                                 border: .init(width: .zero, colorSet: .init(normal: .init(color: .clear))))
    }
}

struct InternalDesignedButtonParameters {
    var tintColor: DesignedButtonTintColor?
    var titleColor: DesignedButtonTitleColor?
    var cornerRadius: DesignedButtonCornerRadius?
    var backgroundColor: DesignedButtonBackgroundColor?
    var border: DesignedButtonBorder?
}
