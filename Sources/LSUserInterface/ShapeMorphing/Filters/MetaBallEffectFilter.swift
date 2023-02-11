//
//  MetaBallEffectFilter.swift
//  
//
//  Created by Алексей Филиппов on 12.01.2023.
//

import CoreImage
import CoreImage.CIFilterBuiltins

final class MetaBallEffectFilter: CIFilter {
    let blurFilter: CIFilter & CIGaussianBlur = {
        let blur = CIFilter.gaussianBlur()
        blur.radius = 30
        return blur
    }()
    let thresholdFilter = LumaThresholdFilter()
    
    @objc dynamic var inputImage: CIImage?
    override var outputImage: CIImage? {
        guard let inputImage = self.inputImage else { return nil }
        blurFilter.inputImage = inputImage
        let blurredOutput = blurFilter.outputImage
        thresholdFilter.inputImage = blurredOutput
        return thresholdFilter.outputImage
    }
}
