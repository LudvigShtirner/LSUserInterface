//
//  UIImage+Resize.swift
//  
//
//  Created by Алексей Филиппов on 12.01.2023.
//

// Apple
import UIKit
import AVFoundation

extension UIImage {
    func resized(within newSize: CGSize,
                 outputScale: CGFloat? = nil) -> UIImage {
        let withinBounds = CGRect(origin: .zero, size: newSize)
        var newFrame = AVMakeRect(aspectRatio: size, insideRect: withinBounds)
        newFrame.origin = .zero
        
        let format = UIGraphicsImageRendererFormat.preferred()
        if let scale = outputScale {
            format.scale = scale
        }
        let renderer = UIGraphicsImageRenderer(size: newFrame.size, format: format)
        let image = renderer.image { _ in
            self.draw(in: newFrame)
        }
        return image.withRenderingMode(renderingMode)
    }
}
