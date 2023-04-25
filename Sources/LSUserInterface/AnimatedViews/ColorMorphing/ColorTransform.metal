//
//  ColorTransform.metal
//  PackagesProject
//
//  Created by Алексей Филиппов on 21.03.2023.
//

#include <metal_stdlib>
using namespace metal;

float4 colorTransform(sampler src, sampler src2, float progress) {
//    float2 pos = src.coord();
//    float4 pixelColor = src.sample(pos);
//    float4 pixelColor2 = src2.sample(pos);
//
//    return float4(pixelColor.r + (pixelColor2.r - pixelColor.r) * progress,
//                  pixelColor.g + (pixelColor2.g - pixelColor.g) * progress,
//                  pixelColor.b + (pixelColor2.b - pixelColor.b) * progress,
//                  1.0);
    return float4(1.0);
}
