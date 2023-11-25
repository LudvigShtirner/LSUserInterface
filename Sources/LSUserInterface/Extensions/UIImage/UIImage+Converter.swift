//
//  UIImage+Converter.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

import UIKit

private let defaultCIContext = CIContext()

public extension UIImage {
    func getCGImage() -> CGImage {
        if let image = cgImage {
            return image
        }
        guard let ciimage = ciImage else {
            fatalError("Image must be implemented by Core Image or Core Graphics")
        }
        guard let createdImage = defaultCIContext.createCGImage(ciimage, from: ciimage.extent) else {
            fatalError("Context Error")
        }
        return createdImage
    }
    
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
