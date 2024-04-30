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
    func setTintColor(_ tintColor: ColorMap) -> Self
    
    @discardableResult
    func setImage(_ image: UIImage?) -> Self
    @discardableResult
    func setHighlightedImage(_ highlightedImage: UIImage?) -> Self
    @discardableResult
    func setContentMode(_ contentMode: UIView.ContentMode) -> Self
}

protocol DesignedImageViewInterfaceInternal: DesignedImageViewInterface {
    var lsTintColor: DesignedImageViewTintColor? { get set }
}

extension DesignedImageViewInterfaceInternal {
    @discardableResult
    public func setTintColor(_ tintColor: ColorMap) -> Self {
        lsTintColor = DesignedImageViewTintColor(tintColor: tintColor)
        lsTintColor?.apply(to: self)
        return self
    }
    
    @discardableResult
    public func setImage(_ image: UIImage?) -> Self {
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
    public func setHighlightedImage(_ highlightedImage: UIImage?) -> Self {
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
    public func setContentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
}
