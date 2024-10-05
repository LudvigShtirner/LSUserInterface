//
//  DesignedImageViewInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedImageViewInterface: UIImageView {
    func useTintColor(_ tintColor: ColorMap)
    
    func useImage(_ image: UIImage?)
    func useHighlightedImage(_ highlightedImage: UIImage?)
}

protocol DesignedImageViewInterfaceInternal: DesignedImageViewInterface {
    var lsTintColor: DesignedImageViewTintColor? { get set }
}

extension DesignedImageViewInterfaceInternal {
    public func useTintColor(_ tintColor: ColorMap) {
        lsTintColor = DesignedImageViewTintColor(tintColor: tintColor)
        lsTintColor?.apply(to: self)
    }
    
    public func useImage(_ image: UIImage?) {
        guard let image else {
            self.image = nil
            return
        }
        image.prepareForDisplay { [weak self] image in
            DispatchQueue.callOnMainQueue {
                self?.image = image
            }
        }
    }
    
    public func useHighlightedImage(_ highlightedImage: UIImage?) {
        guard let highlightedImage else {
            self.highlightedImage = nil
            return
        }
        highlightedImage.prepareForDisplay { [weak self] image in
            DispatchQueue.callOnMainQueue {
                self?.highlightedImage = image
            }
        }
    }
}
