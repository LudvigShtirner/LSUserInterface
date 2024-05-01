//
//  DesignedImageViewInterface.swift
//
//
//  Created by Алексей Филиппов on 30.04.2024.
//

// Apple
import UIKit

public protocol DesignedImageViewInterface: UIImageView {
    @discardableResult
    func usingTintColor(_ tintColor: ColorMap) -> Self
    
    @discardableResult
    func usingImage(_ image: UIImage?) -> Self
    @discardableResult
    func usingHighlightedImage(_ highlightedImage: UIImage?) -> Self
    @discardableResult
    func usingContentMode(_ contentMode: UIView.ContentMode) -> Self
}

protocol DesignedImageViewInterfaceInternal: DesignedImageViewInterface {
    var lsTintColor: DesignedImageViewTintColor? { get set }
}

extension DesignedImageViewInterfaceInternal {
    @discardableResult
    public func usingTintColor(_ tintColor: ColorMap) -> Self {
        lsTintColor = DesignedImageViewTintColor(tintColor: tintColor)
        lsTintColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func usingImage(_ image: UIImage?) -> Self {
        guard let image else {
            self.image = nil
            return self
        }
        image.prepareForDisplay { [weak self] image in
            DispatchQueue.callOnMainQueue {
                self?.image = image
            }
        }
        return self
    }
    
    @discardableResult
    public func usingHighlightedImage(_ highlightedImage: UIImage?) -> Self {
        guard let highlightedImage else {
            self.highlightedImage = nil
            return self
        }
        highlightedImage.prepareForDisplay { [weak self] image in
            DispatchQueue.callOnMainQueue {
                self?.highlightedImage = image
            }
        }
        return self
    }
    
    @discardableResult
    public func usingContentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
}
