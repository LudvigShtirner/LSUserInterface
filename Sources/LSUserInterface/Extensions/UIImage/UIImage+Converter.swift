//
//  UIImage+Converter.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

import UIKit

private let defaultCIContext = CIContext()

public extension UIImage {
    func getCGImage() throws -> CGImage {
        if let cgImage {
            return cgImage
        }
        guard let ciImage else {
            throw UIImageConverterError.imageDoesntFacedWithCoreGraphicsOrCoreImage
        }
        guard let createdImage = defaultCIContext.createCGImage(ciImage, from: ciImage.extent) else {
            throw UIImageConverterError.contextError
        }
        return createdImage
    }
    
    func getCIImage() throws -> CIImage {
        if let ciImage {
            return ciImage
        }
        guard let cgimage = cgImage else {
            throw UIImageConverterError.imageDoesntFacedWithCoreGraphicsOrCoreImage
        }
        return CIImage(cgImage: cgimage)
    }
}

public enum UIImageConverterError: Error {
    case imageDoesntFacedWithCoreGraphicsOrCoreImage
    case contextError
}
