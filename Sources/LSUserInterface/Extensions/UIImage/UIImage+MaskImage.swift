//
//  UIImage+MaskImage.swift
//  
//
//  Created by Алексей Филиппов on 15.11.2023.
//

// Apple
import UIKit

extension UIImage {
    func maskImage() -> CGImage? {
        guard
            let cgimage = cgImage,
            let dataProvider = cgimage.dataProvider,
            let maskImage = CGImage(maskWidth: cgimage.width,
                                    height: cgimage.height,
                                    bitsPerComponent: cgimage.bitsPerComponent,
                                    bitsPerPixel: cgimage.bitsPerPixel,
                                    bytesPerRow: cgimage.bytesPerRow,
                                    provider: dataProvider,
                                    decode: nil,
                                    shouldInterpolate: false)
            else {
                return nil
        }
        return maskImage
    }
}
