//
//  LumaThresholdFilter.swift
//  
//
//  Created by Алексей Филиппов on 12.01.2023.
//

import CoreImage

final class LumaThresholdFilter: CIFilter {
    var threshold: CGFloat = 0.5
    static let thresholdKernel = CIColorKernel(source: """
kernel vec4 thresholdFilter(__sample image, float threshold)
{
    float luma = (image.r * 0.2126) + (image.g * 0.7152) + (image.b * 0.0722);
    return (luma > threshold) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
}
""")
    
    @objc dynamic var inputImage: CIImage?
    override var outputImage: CIImage? {
        guard let inputImage = inputImage else { return nil }
        let arguments = [inputImage, Float(threshold)] as [Any]
        return Self.thresholdKernel?.apply(extent: inputImage.extent,
                                           arguments: arguments)
    }
}
