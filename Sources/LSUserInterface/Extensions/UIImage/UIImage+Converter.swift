//
//  UIImage+Converter.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

import UIKit

public extension UIImage {
    /// Получить CoreGraphics модель изображения
    /// - Returns: CoreGraphics модель изображения
    func getCGImage() -> CGImage {
        if let image = cgImage {
            return image
        }
        guard let ciimage = ciImage else {
            fatalError("Image must be implemented by Core Image or Core Graphics")
        }
        guard let createdImage = CIContext().createCGImage(ciimage, from: ciimage.extent) else {
            fatalError("Context Error")
        }
        return createdImage
    }
    
    /// Получить CoreGraphics модель изображения
    /// - Returns: CoreGraphics модель изображения
    func getCIImage() -> CIImage {
        if let image = ciImage {
            return image
        }
        guard let cgimage = cgImage else {
            fatalError("Image must be implemented by Core Image or Core Graphics")
        }
        return CIImage(cgImage: cgimage)
    }
}
